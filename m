From: Carmelo AMOROSO <carmelo.amoroso@st.com>
Date: Wed, 29 Aug 2007 15:41:36 +0200
Subject: [Buildroot] Problem #including <string>
In-Reply-To: <46D573C8.7060701@carallon.com>
References: <46D54452.7080204@carallon.com> <46D5467E.5010802@st.com>
	<46D573C8.7060701@carallon.com>
Message-ID: <46D57790.1040204@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Will Wagner wrote:
> Carmelo AMOROSO wrote:
>> Probably you have uClibc built with SUSv3_MACRO defined (among these 
>> there is index )
>>
>> Cheers,
>> Carmelo
>>> ------------------------------------------------------------------------ 
>>>
>
> Thank you that fixed it. Why would you want the SUSv3_MACRO defined?
>
If some applications still call the legacy SUSv3 api, you may need
to enable this option within uClibc, anyway, just to avoid name clashing
when building some application (in your case), it's better to use
the function version of the SUSv3 api and not macros... (if cannot patch 
the application)

but if you doesn't needs this interfaces, safely remove this support 
from uClibc.

Carmelo

P.S.
CC the buildroot ML to get other feedbacks it is the case
