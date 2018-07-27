From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Fri, 27 Jul 2018 12:30:15 -0700
Subject: [Buildroot] RHEL6 autobuilder
In-Reply-To: <20180726094334.4da615cf@windsurf>
References: <05bbe42a7a77f46daa8a.1532020842@cveaol6qa08.wv.mentorg.com>
 <20180725231245.7e1e2f99@windsurf>
 <a5beffd9-7db4-1836-ba1e-a301a2ac90c6@mentor.com>
 <20180726094334.4da615cf@windsurf>
Message-ID: <20ef3a8f-2fa6-6c31-852c-0a11a72c8a16@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/26/2018 12:43 AM, Thomas Petazzoni wrote:
>
>>> However, a larger question is: do you intend to contribute an
>>> autobuilder that tests Buildroot under RHEL6 ? Indeed, you are fixing
>>> just the few packages that are useful to you, but if we are going to
>>> support something as old as RHEL6, then we need to do it properly and
>>> have an autobuilder running on this distro. Do you think this is
>>> something that could be done ?
>> Not certain, but possible. What does it entail, exactly? Do I just have
>> to run
>> https://git.buildroot.net/buildroot-test/tree/scripts/autobuild-run via
>> cron?
> It is about running this script yes, but it does not need to be run in
> cron, the script itself is an infinite loop that continuously does some
> builds and contribute the results to autobuild.buildroot.org.

OK, I set this up on a RHEL6.5 host, and it ran enough to hit the known 
libglib2 problem <https://patchwork.ozlabs.org/patch/947086/>. I 
encountered two issues along the way:

  * buildroot-test/buildroot-autobuild script uses the --detach option
    to 'git checkout', which RHEL6.5's git doesn't know about. I just
    deleted the option and everything's working fine. I can submit a
    patch if you like.
  * buildroot/utils/genrandconfig uses argparse, which doesn't exist in
    RHEL6.5's Python. I avoided the problem for now by supplying an
    alternate Python installation.

I guess I just need HTTP credentials to submit to 
http://autobuild.buildroot.org ?

Hollis Blanchard
Mentor Graphics Emulation Division

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180727/e4b5cf34/attachment.html>
