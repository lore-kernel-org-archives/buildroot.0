From: Martin Bark <martin@barkynet.com>
Date: Tue, 29 May 2018 11:40:46 +0100
Subject: [Buildroot] [PATCH 1/2] package/ca-certificates: don't hash
 certificates.crt
In-Reply-To: <87sh6a7ozz.fsf@dell.be.48ers.dk>
References: <20180506161944.7451-1-martin@barkynet.com>
 <87a7sjuf97.fsf@dell.be.48ers.dk>
 <CAFGQKxf5Nn5AKMJ6-n8Ue_qvoE-O9x09yoC9T1nbz5OOp5781g@mail.gmail.com>
 <87sh6a7ozz.fsf@dell.be.48ers.dk>
Message-ID: <CAFGQKxdUvbWSbiEtkSOad=Vtx7Y0fAmPMFi_Sz2NKmDWiK2jsw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On 29 May 2018 at 11:08, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Martin" == Martin Bark <martin@barkynet.com> writes:
>
>  > Peter,
>  > On 29 May 2018 at 07:50, Peter Korsgaard <peter@korsgaard.com> wrote:
>
>  >> >>>>> "Martin" == Martin Bark <martin@barkynet.com> writes:
>  >>
>  >> > Copy certificates.crt to /etc/ssl/certs after we run c_rehash to
>  >> > prevent it getting hashed by mistake.
>  >>
>  >> What is the effect of running c_rehash on it? Just an extra symlink or
>  >> any functional difference?
>  >>
>
>  > c_rehash hashes certificates.crt by mistake and that symlink clashes
> with
>  > one of the CA certificates.  The end result is one of the hashes
>  > incorrectly points to certificates.crt instead of the CA certificate.  I
>  > noticed this during testing because i checked /etc/ssl/certs was the
> same
>  > as under ubuntu.
>
> Ok, can you rework the commit message with these details (and perhaps
> the for loop change) and resubmit? Thanks!
>

Will do

Thanks

Martin


>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180529/9cf889bf/attachment.html>
