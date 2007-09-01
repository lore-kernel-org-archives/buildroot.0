From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 1 Sep 2007 18:34:35 +0200
Subject: [Buildroot] Problem #including <string>
In-Reply-To: <46D57790.1040204@st.com>
References: <46D54452.7080204@carallon.com> <46D5467E.5010802@st.com>
	<46D573C8.7060701@carallon.com> <46D57790.1040204@st.com>
Message-ID: <20070901163435.GN11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 29, 2007 at 03:41:36PM +0200, Carmelo AMOROSO wrote:
>Will Wagner wrote:
>> Carmelo AMOROSO wrote:
>>> Probably you have uClibc built with SUSv3_MACRO defined (among these 
>>> there is index )
>>>
>>> Cheers,
>>> Carmelo
>>>> ------------------------------------------------------------------------ 
>>>>
>>
>> Thank you that fixed it. Why would you want the SUSv3_MACRO defined?

You don't want UCLIBC_SUSV3_LEGACY_MACROS nor UCLIBC_SUSV3_LEGACY, as a
general rule of thumb.
>>
>If some applications still call the legacy SUSv3 api, you may need
>to enable this option within uClibc, anyway, just to avoid name clashing
>when building some application (in your case), it's better to use
>the function version of the SUSv3 api and not macros... (if cannot patch 
>the application)
>
>but if you doesn't needs this interfaces, safely remove this support 
>from uClibc.
