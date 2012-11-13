From: Chris Zankel <chris@zankel.net>
Date: Tue, 13 Nov 2012 13:01:03 -0800
Subject: [Buildroot] [PATCH 2/2 v3] xtensa: support configurable
 processor configurations
In-Reply-To: <50A2ADBC.9080704@mind.be>
References: <509d9db2.4883440a.7065.016e@mx.google.com>
 <509DA516.40007@mind.be> <50A169FC.6010708@zankel.net>
 <50A16B1E.8030703@mind.be> <50A18A2B.1050102@zankel.net>
 <50A2ADBC.9080704@mind.be>
Message-ID: <50A2B50F.60609@zankel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Sorry, I got your email after I sent out version 4 of the patch, which
doesn't include the change you mentioned (somehow, fetchmail was stuck
:-( So, please let me know if you want me to send out another version
that includes that change. I don't want to confuse Thomas with all those
versions...

Thanks,
-Chris



On 11/13/2012 12:29 PM, Arnout Vandecappelle wrote:
>> I guess I don't understand what that patch does, i.e. where is the
>> 'if...endif'? Could you maybe point to the patch?
>   I'm talking about http://patchwork.ozlabs.org/patch/196916/
> In arch/Config.in, it introduces the following construct:
>
> if BR2_xtensa
> source "arch/Config.in.xtensa"
> endif
>
>   This removes the need for adding 'depend on BR2_xtensa' in every config
> option in that file.
>
>   It's true that _now_ xtensa would be the only one using that scheme, but the
> idea is that if you do that for xtensa now, it will be easier to merge in
> Thomas's patch later (or vice versa, it will be easier to rebase your patch
> once Thomas's patch gets merged).
