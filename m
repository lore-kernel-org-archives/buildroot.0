From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 26 Jul 2018 09:55:18 +0200
Subject: [Buildroot] [PATCH 1 of 3] host-acl: build fix on RHEL6 hosts
 (GCC 4.4.7)
In-Reply-To: <20180726094334.4da615cf@windsurf>
References: <05bbe42a7a77f46daa8a.1532020842@cveaol6qa08.wv.mentorg.com>
 <20180725231245.7e1e2f99@windsurf>
 <a5beffd9-7db4-1836-ba1e-a301a2ac90c6@mentor.com>
 <20180726094334.4da615cf@windsurf>
Message-ID: <18e23c8e-d09a-1b4c-6e81-e46f78844f24@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26-07-18 09:43, Thomas Petazzoni wrote:
> Hello Hollis,
> 
> On Wed, 25 Jul 2018 15:10:56 -0700, Hollis Blanchard wrote:
> 
>>>> +Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>  
[snip]
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
> 
> It is about running this script yes, but it does not need to be run in
> cron, the script itself is an infinite loop that continuously does some
> builds and contribute the results to autobuild.buildroot.org.

 You also need disk space, at least 100GB per job I think? That's the sole
reason why I'm not running an autobuilder myself. It's very annoying to get
spurious failures because of -ENOSPC.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
