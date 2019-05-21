From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 21 May 2019 10:31:41 +0200
Subject: [Buildroot] [PATCH] package/atop: fix BUG_85180 build timeout
In-Reply-To: <20190521100237.18d46daa@windsurf.home>
References: <20190520212723.63754-1-giulio.benetti@micronovasrl.com>
 <20190521091551.384da8a1@windsurf.home>
 <757973bf-7d43-f3d6-8364-b4353d42b317@mind.be>
 <20190521100237.18d46daa@windsurf.home>
Message-ID: <201371a2-09c0-9919-72f5-ee7a8bc8b58e@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout, Thomas,

Il 21/05/2019 10:02, Thomas Petazzoni ha scritto:
> Hello,
> 
> On Tue, 21 May 2019 09:55:16 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>>   I think it's just that in *this* case, it is also solved by using -g1 instead
>> of -g2, which is less "aggressive" than passing -O0. However, I agree with
>> Thomas that it's better to use the same solution everywhere, even if it is
>> suboptimal.
> 
> I agree: using the same solution everywhere is better, even if slightly
> suboptimal here or there.

Ok.

>>   Just to be sure: in some cases, -Os also works, but not in all cases, right?
>> Otherwise I'd actually prefer -Os instead of -O0.

I've just retried with -Os, unfortunately glibmm fails while all the 
others work.

So I'm going to keep -O0 for every package with BUG_85180.

Thank you

Best regards
-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
