From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Jun 2019 14:00:48 +0200
Subject: [Buildroot] [PATCH 4/4] package/iputils: fix build without
 setcap
In-Reply-To: <20190609223926.GB26152@x230>
References: <20190609093814.14169-1-fontaine.fabrice@gmail.com>
 <20190609093814.14169-4-fontaine.fabrice@gmail.com>
 <dd4f00c5-f8ae-1758-48e4-bab512adb2a2@mind.be> <20190609214531.GA17515@x230>
 <CAPi7W80ms+GTYwC9Q6usykCFxWjA7+1FSy2-KR3qW16RFdEBPA@mail.gmail.com>
 <20190609223926.GB26152@x230>
Message-ID: <b6526d34-3d18-edba-ed44-0c5c376f4afd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/06/2019 00:39, Petr Vorel wrote:
> Hi,
> 
>> Could you send the patch setting back IPUTILS_PERMISSIONS and using
>> NO_SETCAP_OR_SUID?
> Going to do it.

 I wonder a bit about the setcap though. As I understand it, you would use
*either* setcap *or* setuid. Before the bump, IPUTILS_PERMISSIONS would do
setuid. Clearly, setcap is way better.

 Is there any reason not to use setcap (or actually, xattrs)? Maybe some
filesystems don't support xattrs - iso9660 for example?


>> From my understanding, permissions should be set to ping and
>> traceroute6 as done before the dump but also to clockdiff and arping.
> Also it's needed to create symlink from ping to ping6.
> But haven't find a way how.

 Just do it in a post-install hook, no?

 Regards,
 Arnout
