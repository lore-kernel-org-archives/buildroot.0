From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 1 Feb 2016 19:02:09 +0100
Subject: [Buildroot] [PATCH] libcurl: enable mbedtls support
In-Reply-To: <56AF9C3D.6020805@zacarias.com.ar>
References: <1452106417-12097-1-git-send-email-gustavo@zacarias.com.ar>
 <56AF8788.7090702@lucaceresoli.net> <56AF88F9.2000904@zacarias.com.ar>
 <56AF9B59.4090508@lucaceresoli.net> <56AF9C3D.6020805@zacarias.com.ar>
Message-ID: <56AF9DA1.9000806@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gostavo,

Gustavo Zacarias wrote:
> On 01/02/16 14:52, Luca Ceresoli wrote:
>
>> Thank you for the explanation. Indeed, it got me totally puzzled! I am
>> no mbedtls/polarssl expert, I never used them...
>>
>> If I understand correctly:
>>   - without this patch, the comment states that you'd need to upgrade
>>     polarssl to 1.3.x to have it supported in libcurl
>>   - with the patch libcurl uses mbedtls, which makes polarssl
>>     uninteresting.
>>
>> Is it correct?
>
> Hi Luca.
> Yes, the polarssl comment becomes redundant, since we can't support our
> current 1.2.x and we can't (easily) upgrade to 1.3.x, which i think
> would be pointless.
> Newer openvpn can support 1.3.x but not newer, i know git master which
> is very much in a -dev state can do 2.x but i wouldn't pick that up
> lightly.
> Regarding shairport-sync i don't know if it can work with newer
> versions, maybe it can do mbedtls directly now that it's been bumped.

I see, thanks for the additional clarification. Now it makes sense.

Since it is non-obvious (at least it wasn't to me), it's worth adding a
comment, such as: "mbedtls is a successor or polarssl, thus polarssl
support is useless".

Care to resend with that?

Thanks,
-- 
Luca
