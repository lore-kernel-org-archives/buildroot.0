From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 31 Jul 2014 07:54:51 -0500
Subject: [Buildroot] [PATCH 0 of 7] Introduction of kconfig-package
	infrastructure
In-Reply-To: <1141785278.21136820.1406794808628.JavaMail.root@openwide.fr>
References: <CAAXf6LWQWWkXt-MaUwQkhYORMOxXCEgWy14epVieZBcBteCEBg@mail.gmail.com>
 <1141785278.21136820.1406794808628.JavaMail.root@openwide.fr>
Message-ID: <CANQCQpZKBkLMpC8RXiqkzdF83CS6FK+VLx5nJWq0Wv+quv1SoQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jeremy,

On Thu, Jul 31, 2014 at 3:20 AM, Jeremy Rosen <jeremy.rosen@openwide.fr> wrote:
>
> ----- Mail original -----
>> Hi Jeremy,
>>
>> On Thu, Jul 31, 2014 at 8:57 AM, Jeremy Rosen
>> <jeremy.rosen@openwide.fr> wrote:
>> >
>> > Quick question... is it possible to relocate the .config file
>> > elsewhere using env variables ? I am still on my quest to move
>> > all project specific files (i.e configuration files) out of the
>> > buildroot directory to be able to build a buildroot project
>> > without touching the main buildroot directory...
>>
>> Do you really mean the .config file (the destination file) or do you
>> mean the file that contains the starting configuration, and that may
>> be updated with foo-update-config ?
>>
>
> I don't like the way you have to separately save your kernel configuration
> after editing it (update after menuconfig) i'd rather not have to do
> that, but that's the general buildroot philosophy, so i'll follow it
>
> so yes, what I want is the config file that will eventually be used
> by buildroot.
>
>
>> For the latter, individual packages provide config options for this,
>> for example uclibc and busybox do. You can specify UCLIBC_CONFIG_FILE
>> on the command line to overwrite it, similarly for
>> BUSYBOX_CONFIG_FILE.
>>
>
> If these are overloadable from the command line, I should be good, thx

Another option might be to use the BR2_EXTERNAL concept to
config manage your customization(s) outside of the main buildroot directory.

http://buildroot.uclibc.org/downloads/manual/manual.html#outside-br-custom

>
>> Best regards,
>> Thomas
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Matthew L Weber / Sr Software Engineer / Platform Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
Phone: 319-295-7349
matthew.weber at rockwellcollins.com
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
