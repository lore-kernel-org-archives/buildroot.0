From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 4 Mar 2012 14:01:40 +0100
Subject: [Buildroot] [PATCH 2/2] Add test infrastructure
In-Reply-To: <201203040113.27598.yann.morin.1998@free.fr>
References: <1330818307-22115-1-git-send-email-arnout@mind.be>
 <1330818307-22115-3-git-send-email-arnout@mind.be>
 <201203040113.27598.yann.morin.1998@free.fr>
Message-ID: <201203041401.40738.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 04 March 2012 01:13:27 Yann E. MORIN wrote:

[snip]
> > +testdir=$(dirname $0)
> > +topdir=$(cd $testdir/..; pwd)
> 
> I would highly suggest using ${foo} instead of $foo because it makes
> it explicit what the variable name is. Also, enclose variable between
> double-quotes, in case a vicious user uses a dir with a space in it.

 Spaces will make 'make' barf, so aren't supported anyway.  But * and
other ugly stuff would indeed be possible, so I've added quotes
everywhere.

[snip]
> See the "The Open Group Base Specifications Issue 7", utilities chapter 2,
> dealing about "Shell Command Language":
>     http://pubs.opengroup.org/onlinepubs/9699919799/toc.htm
>     http://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html

 That's a useful reference!  I'll look at that more often, thanks!

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
