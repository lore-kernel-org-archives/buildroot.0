From: Mirza Krak <mirza.krak@northern.tech>
Date: Wed, 15 Aug 2018 14:26:46 +0200
Subject: [Buildroot] [PATCH 5/8] package/mender: add
 BR2_PACKAGE_MENDER_DEVICE_TYPE option
In-Reply-To: <20180815135507.6c321a4a@windsurf>
References: <20180814231337.19114-1-mirza.krak@northern.tech>
 <20180814231337.19114-6-mirza.krak@northern.tech>
 <20180815135507.6c321a4a@windsurf>
Message-ID: <CADHdJwA+gYRAc5r1PGaE4ubaudUhJh5cmQeuaAgAWACPV-oAZQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 15, 2018 at 1:55 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Wed, 15 Aug 2018 01:13:34 +0200, Mirza Krak wrote:
>
>> +config BR2_PACKAGE_MENDER_DEVICE_TYPE
>> +     string "Mender device type"
>> +     help
>> +       A string that defines the type of device which will be used to check
>> +       compatibility of update artifacts. Once a device is flashed with this,
>> +       it will not change, even if the device is updated using Mender.
>> +
>> +       Will be stored in /data/mender/device_type. Note that /data is a mount
>> +       point for the persistent data partition.
>
> I am a bit confused with "Note that /data is a mount point for the
> persistent data partition". If /data is a different partition than the
> root filesystem one, then what is the point of
> having /data/mender/device_type in the root filesystem ? It will be
> hidden by whatever partition gets mounted in /data.

Understand the confusion, my intention was to convert the /data
directory on target image to an ext4 image in a post build step and
that is why I put these files there. Or is there a better way of
"staging" files for post build steps?

>
> (Side note: please make sure to run check-package on your changes, the
> Config.in help text lines look a bit too long.)

Will do.

-- 
Mirza Krak | Embedded Solutions Architect | https://mender.io

 Northern.tech AS | @northerntechHQ
