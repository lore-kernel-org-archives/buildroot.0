From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Nov 2015 12:09:38 +0100
Subject: [Buildroot] [PATCH] package/minidlna: fix static build
In-Reply-To: <87io4y9umq.fsf@dell.be.48ers.dk>
References: <1447889466-8504-1-git-send-email-yann.morin.1998@free.fr>
 <87mvua9uzr.fsf@dell.be.48ers.dk> <87io4y9umq.fsf@dell.be.48ers.dk>
Message-ID: <D2494AFA-3325-405C-89FA-5B245DB586E5@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On November 19, 2015 11:00:13 AM GMT+01:00, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
>
>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> >> libvorbix.pc does not exist, it is named vorbis.pc.
>
> > libvorbis.pc
>
> >> Also, sqlite3 was missing when querying pkg-config.
>
> > No autobuilder references?
>
>Looking at the autobuilder failures
>(http://autobuild.buildroot.net/?reason=minidlna-1.1.5) they all seem
>to
>be caused by BR2_COMPILER_PARANOID_UNSAFE_PATH and the configure script
>adding /usr/local when checking for libraries/headers :/
>
>-- 
>Bye, Peter Korsgaard
>_______________________________________________
>buildroot mailing list
>buildroot at busybox.net
>http://lists.busybox.net/mailman/listinfo/buildroot

Peter,

If you look earlier in the config.log,
you'll see the actual errors.

Looking at configure.ac, it becomes
obvious why that happens:

for l in "" /usr/lib ... do ...

Regards,
Yann E. MORIN.
-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151119/6f6ae9a7/attachment.html>
