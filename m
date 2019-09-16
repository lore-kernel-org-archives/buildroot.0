From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 16 Sep 2019 14:06:17 +0200
Subject: [Buildroot] [PATCH v2 2/2] toolchain/toolchain-wrapper: handle
 __FILE__ macro for reproducibility
In-Reply-To: <CABM+sgpPSEbWvbi36=tMPfnyC_GSTZ0QqhRSNdtQJ2YhB7WBbw@mail.gmail.com>
References: <20190831180113.16025-1-itsatharva@gmail.com>
 <20190831180113.16025-2-itsatharva@gmail.com>
 <4675dbb2-7b28-3002-d18b-1760de956933@smile.fr>
 <CABM+sgpPSEbWvbi36=tMPfnyC_GSTZ0QqhRSNdtQJ2YhB7WBbw@mail.gmail.com>
Message-ID: <b938a482-9f96-9f62-618d-4c4039b44fc1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16/09/2019 13:54, Atharva Lele wrote:
[snip]
>> I'm not sure about __builtin_FILE().
> 
> I'm not sure either.. maybe we should keep it as is for now.
> Arnout, any thoughts on this?

 There's no way to handle __builtin_FILE() correctly, because it's defined as a
function, not a macro. However, we already don't handle __FILE__ correctly
(since it should contain the actual file name, and not just a constant), so I
guess doing something like -D__builtin_FILE()=\"...\" should work.

 BTW, now I think a bit more about this... The __FILE__ macro (and related) are
used in 99% of the cases for debugging and logging output. Putting
'file-path-replaced-by-buildroot-for-reproducibility' there is hardly helpful.
Maybe it would be better to just put the empty string. Romain, what do you think?

 Regards,
 Arnout
