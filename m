From: Jens Maus <mail@jens-maus.de>
Date: Sat, 10 Jun 2017 09:04:47 +0200
Subject: [Buildroot] [PATCH 2/2] package/nut: specify --with-user/group
 when building NUT
In-Reply-To: <20170608192014.GB3058@scaer>
References: <20170608153557.30726-1-mail@jens-maus.de>
 <20170608192014.GB3058@scaer>
Message-ID: <B2B80EDF-A4B3-4D1A-AE33-F52EF46D829C@jens-maus.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

> Am 08.06.2017 um 21:20 schrieb Yann E. MORIN <yann.morin.1998@free.fr>:
> 
> On 2017-06-08 17:35 +0200, Jens Maus spake thusly:
>> This commit fixes a problem where the NUT package couldn't be
>> used as a NUT server due to the fact that the default group for
>> nobody is "nogroup" and not "nobody" like the internal default
>> of NUT. Thus, when starting a NUT server daemon the daemon starts
>> with incorrect group permissions and generated some error messages.
>> This commit fixes this shortcoming by specifying --with-user/group
>> when running configure.
>> 
>> Signed-off-by: Jens Maus <mail@jens-maus.de>
>> ---
>> package/nut/nut.mk | 4 +++-
>> 1 file changed, 3 insertions(+), 1 deletion(-)
>> 
>> diff --git a/package/nut/nut.mk b/package/nut/nut.mk
>> index 332ccf907..ab8a17868 100644
>> --- a/package/nut/nut.mk
>> +++ b/package/nut/nut.mk
>> @@ -18,7 +18,9 @@ NUT_AUTORECONF = YES
>> # since the default location (/var/state/ups) maybe readonly.
>> NUT_CONF_OPTS = \
>> 	--with-altpidpath=/var/run/upsd \
>> -	--without-hal
>> +	--without-hal \
>> +	--with-user=nobody \
> 
> 'nobody' is the default for the user, so it does not seem to be needed
> to specify it, as we do have nobody. Being explicit is probably better.
> 
>> +	--with-group=nogroup
> 
> Yup.
> 
> Note however that nut does not recommend running as nobody/nogroup.
> 
> Instead, I would suggest we do add a user definition for nut, and
> use that for configure.
> 
>    define NUT_USER
>        nut -1 nut -1 * - - - Nut user
>    endef

Thanks for your comments. Indeed I could remove ?with-user=nobody from my patchset. And of course it would be better to run NUT with a new user. But IMHO for the time being the patch I submitted should be sufficient and we can apply an additional patch later. Or is my patch rejected now and I need to rework it for being accepted? Sorry for asking, but I am fairly new to submitting patches to buildroot and I am not fully confident to the procedure. In addition, I cannot see my initial patch at patchwork anymore?!?!

regards,
jens
-- 
Jens Maus, Dresden/Germany
http://jens-maus.de/

*** Content is authentic only with digital signature  ***

-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/pkcs7-signature
Size: 3745 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170610/0a08b2fb/attachment.p7s>
