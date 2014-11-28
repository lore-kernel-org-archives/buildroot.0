From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 28 Nov 2014 10:05:56 +0000
Subject: [Buildroot] Split supported architectures for Qt Script and Qt
	Webkit
In-Reply-To: <87tx1kmc1o.fsf@dell.be.48ers.dk>
References: <546DD5C9.8090600@imgtec.com> <87tx1kmc1o.fsf@dell.be.48ers.dk>
Message-ID: <54784904.9080602@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

first of all, thank you very much for taking your time to read the email.

On 11/27/2014 11:57 PM, Peter Korsgaard wrote:
>>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:
> 
>  > Dear all,
>  > please I would like you read this email and provide some feedback before
>  > I start writing a patch.
> 
> Thanks for investigating!
> 
>  > I have assigned a code to each kind of problem I have found, and the
>  > meaning of those codes are just below the table.
> 
>  > +------------------+-----------+-----------+----------+--------------+
>  > | Architecture     | Qt Script | Qt Webkit | Grantlee | Problem Code |
>  > +------------------+-----------+-----------+----------+--------------+
>  > | BR2_aarch64      | YES       | NO        | YES      | 2            |
>  > | BR2_nios2        | YES       | NO        | NO       | 4            |
> 
> So the only ones not covered today are these two, right? What about the
> mips variant you mentioned above?

Well, QT Webkit fails to compile for aarch64, but for nios2 is
different. The package which fails is Qt Gui, which is a dependence of
Qt Webkit. So, is not Qt Webkit the one which is failing for nios2, is
Qt Gui. But of course, if you can't have Qt Gui, you can't have Qt
Webkit either :P

The MIPS variant which fails to compile Qt Webkit is MIPS64 n32 ABI. I
will state that when I write the patch.

> The BR2_aarch64 issue will presumably be solved in future qtwebkit
> releases once the arch gets a bit more used. The nios issue is an
> internal compiler error, that is less likely to get fixed (until a new
> compiler is released atleast).

Ok.

Cheers,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Platforms
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
