From: Henrique Marks <henrique.marks@datacom.ind.br>
Date: Fri, 5 Feb 2016 11:22:58 -0200 (BRST)
Subject: [Buildroot] [PATCH 1/1] protobuf: apply patch to compile for
 PowerPC
In-Reply-To: <20160205140909.764ff2e6@free-electrons.com>
References: <1453986515-9505-1-git-send-email-casantos@datacom.ind.br>
 <20160205000613.504940f9@free-electrons.com>
 <1851498233.1377552.1454670293384.JavaMail.zimbra@datacom.ind.br>
 <20160205140909.764ff2e6@free-electrons.com>
Message-ID: <249443164.1454061.1454678578498.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes, once the atomic series enter master branch, we are going to proceed on with this patch:

- Change protobuf, as you stated.
- Change Dependent Packages, it is four or five last time i checked out.
- Build on powerpc these packages, with gcc > 4.8

I guess this is enough.

Thanks



----- Mensagem original -----
> De: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> Para: "DATACOM" <henrique.marks@datacom.ind.br>
> Cc: "Carlos Santos" <casantos@datacom.ind.br>, buildroot at buildroot.org
> Enviadas: Sexta-feira, 5 de fevereiro de 2016 11:09:09
> Assunto: Re: [Buildroot] [PATCH 1/1] protobuf: apply patch to compile for PowerPC

> Hello Henrique,
> 
> On Fri, 5 Feb 2016 09:04:53 -0200 (BRST), Henrique Marks wrote:
> 
>> I agree with you, but let me say that the original patch just corrects a "syntax
>> error" in the code !
>> 
>> + #define GOOGLE_PROTOBUF_ATOMICOPS_ERROR \
>> +-#error "Atomic operations are not supported on your platform"
>> ++"Atomic operations are not supported on your platform"
> 
> Correct. In fact I thought it was only with recent compilers, but it is
> probably incorrect regardless of the gcc version, and it doesn't fail
> in all cases because we ensure that protobuf is only built on
> architecture on which protobuf has built-in support for atomic
> operations. And therefore you don't fall into the #else cases where
> this bogus error macro is used.
> 
>> This syntax error correction was submitted upstream, but wasnt
>> applied to protobuf 2.6.1, just to protobuf 3x series. As we cannot
>> drive the push to protobuf 3.x series right now (but we can in the
>> near future, as soon as the first 3.x appears), we submitted a patch
>> to buildroot.
> 
> Sure. But in this case, we prefer the patch to be a backport from
> upstream, so that it is clearer when bumping that the patch can be
> dropped.
> 
> And also, when a patch has been accepted by upstream, we have a higher
> confidence that the patch is correct.
> 
>> Despite of this, the solution using the atomic patch you sent seems
>> ok. We are using the patch we submmited for six months now,
>> internally, and we try to send upstream everything, as soon as
>> possible, so that we can keep up with the upstream tree. When your
>> solution goes in, we can remove our internal patch (it is submmited
>> in protobuf upstream 3.x anyway).
> 
> OK. Could you work on a proper patch series on the atomic series is
> merged in master ?
> 
> Thanks!
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

-- 
Dr. Henrique Marks
henrique.marks at datacom.ind.br
R. Am?rica, 1000 - Eldorado do Sul - RS
CEP: 92990-000 - Brasil
Fone: +55 51 3933 3000 - Ramal 3466
