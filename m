From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 3 Dec 2015 21:52:35 +0100
Subject: [Buildroot] [PATCH 1/4] dhrystone: add a hash file
In-Reply-To: <87610fep1h.fsf@dell.be.48ers.dk>
References: <1449059383-62131-1-git-send-email-Vincent.Riera@imgtec.com>
 <87poyofulj.fsf@dell.be.48ers.dk> <56601AD5.1090608@imgtec.com>
 <20151203114424.6f129af3@free-electrons.com>
 <87610fep1h.fsf@dell.be.48ers.dk>
Message-ID: <20151203215235.08f8d18c@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Thu, 03 Dec 2015 12:42:50 +0100, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
> Hi,
> 
> >> > Hmm, what are we going to do if this file ever changes?
>  >> 
>  >> isn't the purpose of the hash files to ensure that we download exactly
>  >> what we want to download, so we can make the builds reproducible?
>  >> 
>  >> If that file changes, we will notice it thanks to its hash file. You
>  >> could ask the same for tarballs. What are we going to do if this
>  >> tarballs ever changes?
> 
>  > It also took me a bit to understand Peter's comment. I believe what
>  > Peter means is that this file has no version in its name. So if
>  > upstream changes the file, the hash will change, and we will notice.
> 
> Yes, my reply was perhaps a bit too terse.
> 
>  > But it will break every previous Buildroot version that has been
>  > released, since the old file can no longer be fetched from anywhere.
> 
> No, it will not break as long as we keep a backup of the old file on
> sources.buildroot.net, as buildroot will fall back to using that.
> 
> 
>  > But unless I'm missing something, I believe that this is exactly what
>  > we want: if upstream changes the file, it *does* affect old Buildroot
>  > versions, and we want users of such old Buildroot versions to be loudly
>  > notified that the dhry-c file they are building from is no longer the
>  > same than the one that existed at the time the Buildroot they are using
>  > was released.
> 
> Agreed, but the problem is if upstream ever changes the file content (for
> bugfixes or new features) then we cannot use the new version without
> updating our sources.buildroot.net mirror (and hence break old
> releases).
> 

Why not append a (short) hash to the saved file for unversioned downloads?

e.g. dhry-c-038a7e9

Regards,
Peter

> But ok, for something as old as dhrystone this probably isn't very
> likely to happen (and we could carry the improvements/fixes as a local
> patch if it does).
> 
