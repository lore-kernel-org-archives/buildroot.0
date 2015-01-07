From: Paul Cercueil <paul.cercueil@analog.com>
Date: Wed, 7 Jan 2015 09:55:20 +0100
Subject: [Buildroot] [PATCH v5] libiio: new package
In-Reply-To: <20141221223930.6965ea9e@free-electrons.com>
References: <1418722446-3831-1-git-send-email-paul.cercueil@analog.com>
 <20141221223930.6965ea9e@free-electrons.com>
Message-ID: <54ACF478.4080509@analog.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Thanks for merging this patch - and thanks for the extra work.

I see you added a dependency on thread support in the toolchain, is it 
because it breaks some builds if not set?
The library in itself will work just fine on a system without threads, 
only the IIO Daemon requires threads, that's why I'm asking.

Regards,

Paul Cercueil

On 21/12/2014 22:39, Thomas Petazzoni wrote:
> Dear Paul Cercueil,
>
> On Tue, 16 Dec 2014 10:34:06 +0100, Paul Cercueil wrote:
>> Libiio is a library to ease the development of software interfacing
>> Linux Industrial I/O (IIO) devices.
>>
>> http://wiki.analog.com/resources/tools-software/linux-software/libiio
>>
>> v2: Simplify greatly the patch (upstream now uses CMake)
>> v3: Add support for IPv6 and allow installation of systemd service file
>> v4: Added .hash file
>> v5: Rework libiio.mk and init.d scripts after feedback from upstream
>>
>> Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
>> ---
>>   package/Config.in          |  1 +
>>   package/libiio/Config.in   | 43 +++++++++++++++++++++++++++++++++++++++
>>   package/libiio/S99iiod.sh  | 40 +++++++++++++++++++++++++++++++++++++
>>   package/libiio/libiio.hash |  2 ++
>>   package/libiio/libiio.mk   | 50 ++++++++++++++++++++++++++++++++++++++++++++++
>>   5 files changed, 136 insertions(+)
>>   create mode 100644 package/libiio/Config.in
>>   create mode 100644 package/libiio/S99iiod.sh
>>   create mode 100644 package/libiio/libiio.hash
>>   create mode 100644 package/libiio/libiio.mk
>
> Thanks, applied, after doing a bunch of changes:
>
>      [Thomas:
>       - Remove changelog from the commit log.
>       - Rename init script to S99iiod instead of S99iiod.sh
>       - Remove "status" command from init script, and implement "restart"
>         instead.
>       - Add dependency on thread support in toolchain.
>       - Fixup indentation in the .mk file.
>       - Fixup wrapping in the Config.in help text.]
>
> Also, if you don't have any /sys/bus/iio/devices directory, the iiod
> daemon doesn't start, with a mysterious "Unable to create context"
> message, which only appears if you start iiod manually (not from the
> init script). Maybe it should be improved a bit: make sure to have a
> proper error message, and make sure it gets shown when iiod is started
> from the init script.
>
> Thanks!
>
> Thomas
>

-- 
--
Analog Devices GmbH      Wilhelm-Wagenfeld-Str. 6      80807 Muenchen
Sitz der Gesellschaft: Muenchen; Registergericht: Muenchen HRB 40368;
Geschaeftsfuehrer:Dr.Carsten Suckrow, William A. Martin, Margaret Seif
