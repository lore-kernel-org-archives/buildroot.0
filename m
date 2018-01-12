From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jan 2018 16:23:37 +0100
Subject: [Buildroot] [PATCH 1/1] unbound: new package
In-Reply-To: <5990987d-da1e-ec22-738b-6747bd6819cb@petroprogram.com>
References: <20180111232039.24270-1-stefan.froberg@petroprogram.com>
 <jt1miexfp7.ln2@ID-313208.user.individual.net>
 <7b6d5bbd-86f5-6c81-e26e-db8b29ae2831@petroprogram.com>
 <20180112120803.0ddb7b6d@windsurf.lan>
 <5990987d-da1e-ec22-738b-6747bd6819cb@petroprogram.com>
Message-ID: <20180112162337.62276aa1@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 Jan 2018 16:00:27 +0200, Stefan Fr?berg wrote:

> But Thomas, I can't use BR2_PACKAGE_JPEG for turbovnc because it uses
> specific ABI (the so called TurboJPEG ABI)
> from libjpeg-turbo package and vanilla jpeg does not provide it.
> 
> https://libjpeg-turbo.org/About/TurboJPEG
> 
> At least, *if* I remember correctly, turbovnc nagged something about
> missing function when I tried to compile against vanilla jpeg.

Yes, sure, I do remember this perfectly well. turbo-jpeg is kind of an
exception, because it is API compatible with jpeg (so it is logical for
it to be supported in Buildroot as a provider of the jpeg API), but it
also provides its own custom API.

With the current state of things, I believe there is indeed no other
choice for TurboVNC but to use a "depends on BR2_PACKAGE_TURBO_JPEG".
Didn't we already reached this conclusion during the TurboVNC
discussion ?

I know I originally complained against this "depends on", but once
justified with the fact that TurboVNC really only works with
jpeg-turbo's specific API, I'd be OK with using this "depends on".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
