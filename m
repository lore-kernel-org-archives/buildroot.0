From: DATACOM - Edson Siqueira <edson.siqueira@datacom.ind.br>
Date: Tue, 03 Nov 2015 16:14:20 -0200
Subject: [Buildroot] [PATCH 1/1] boost: add option to build
	boost_coroutine
In-Reply-To: <20151103183541.000defd6@free-electrons.com>
References: <1446569978-10357-1-git-send-email-edson.siqueira@datacom.ind.br>
 <20151103183541.000defd6@free-electrons.com>
Message-ID: <5638F97C.7060300@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas Petazzoni,

At the time of commit 611dfe6cb55ed72d7df3b7c102f4a723248a4037, this library
was new to boost and being built regardless of the config. The fix was to
always remove it from compilation to avoid problems with some compilers.
Now, with a proper option, it should be possible to enable it only when
the compiler supports the compilation of this library.

I've tested this patch using a ppc32 toolchain to build the library.

Thanks,

On 03-11-2015 15:35, Thomas Petazzoni wrote:
> Dear Edson Siqueira,
>
> On Tue,  3 Nov 2015 14:59:38 -0200, Edson Siqueira wrote:
>> It was disabled by default by commit 611dfe6cb55ed72d7df3b7c102f4a723248a4037
>> due to the upgrade to boost 1.54.0.
>>
>> Signed-off-by: Edson Siqueira <edson.siqueira@datacom.ind.br>
> Thanks for your contribution. However, you don't explain why you think
> that the problems that lead to commit
> 611dfe6cb55ed72d7df3b7c102f4a723248a4037 have now been fixed. Can you
> give more details ? Have you tested the configurations pointed by the
> 611dfe6cb55ed72d7df3b7c102f4a723248a4037 commit log and verified that
> they now build fine with the coroutine module enabled ?
>
> Thanks,
>
> Thomas

-- 
Edson Siqueira

DATACOM
Projetista de Software Embarcado - P&D
Rua da Gl?ria, 251 - 8 ? andar - Centro C?vico - Curitiba, PR
Fone: +55 41 3089-3670
edson.siqueira at datacom.ind.br
www.datacom.ind.br
