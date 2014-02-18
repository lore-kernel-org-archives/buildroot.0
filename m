From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Feb 2014 16:37:56 +0100
Subject: [Buildroot] [PATCH v4 7/7] Makefile: export PATH
In-Reply-To: <5302FE90.9070402@mind.be>
References: <1392559113-5215-1-git-send-email-s.martin49@gmail.com>
 <1392559113-5215-8-git-send-email-s.martin49@gmail.com>
 <5302FE90.9070402@mind.be>
Message-ID: <20140218163756.0e495167@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 18 Feb 2014 07:32:48 +0100, Arnout Vandecappelle wrote:
> On 16/02/14 14:58, Samuel Martin wrote:
> > This can be useful for:
> > - package using custom build system that are not aware that the host
> >   tree is in $(O)/host/;
> > - post-{build,image} scripts, in case some host-tools were specifically
> >   built to be used by these scripts.
> 
>  This makes all the previous patches redundant, since the PATH=...
> invocations should be removed instead of renamed.

Agreed. Samuel, you should make a choice:

 * Either you use BR_PATH, and we continue to pass PATH=$(BR_PATH)
   whenever the PATH is needed.

 * Or you simply directly export PATH with the right value, and remove
   all occurrences where we manually pass PATH=<something>.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
