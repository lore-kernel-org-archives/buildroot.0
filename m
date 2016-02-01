From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 1 Feb 2016 13:34:01 -0300
Subject: [Buildroot] [PATCH] libcurl: enable mbedtls support
In-Reply-To: <56AF8788.7090702@lucaceresoli.net>
References: <1452106417-12097-1-git-send-email-gustavo@zacarias.com.ar>
 <56AF8788.7090702@lucaceresoli.net>
Message-ID: <56AF88F9.2000904@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/02/16 13:27, Luca Ceresoli wrote:

> This is unrelated to your change, it should be a separate patch. But
> anyway I don't understand why it should be removed: we still package
> polarssl 1.2.18, so the comment should still apply. Am I missing
> something?
>
> With that fixed (or explained):
>   Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
>
> And:
> [Built with/without mbedtls, ran on qemu, checked that 'curl -V' shows
> the SSL only with mbedtls]
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

Hi.
As you know polarssl was renamed to mbedtls when bought by ARM, this was 
circa the 1.3.x release.
Older 1.3.x releases install the library as polarssl alone, newer ones 
install dual as polarssl with symlinks to mbedtls (might be the other 
way around, i don't recall at the moment - it doesn't matter anyway), so 
first the distinction between polarssl and mbedtls is terribly blurred 
for the 1.3.x series.
Incidentally this is what makes polarssl 1.2.x being able to live 
side-by-side with mbedtls (2.x, which doesn't keep legacy handling) (i 
believe this is more product of branding/accident than careful thinking).
So now in some cases polarssl means 1.2.x, in other cases it means 
mbedtls 1.3.x, or the new version because nobody cared to rename everything.
Basically any explanation given out of context is useless without 
historical context.
Making 1.3.x live side-by-side with mbedtls (let's call it that way for 
2+) is probably possible by ditching the new naming and just keeping 
compat, i had a look but i think it was a dead end anyway, this requires 
patching the build of mbedtls/polarssl 1.3.x somewhat and that wouldn't 
be accepted upstream.
Regards.
