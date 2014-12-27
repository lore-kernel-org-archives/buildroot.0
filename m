From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 19:07:55 +0100
Subject: [Buildroot] [PATCH 2/2] libvncserver: add config option for
 tightpng encoding support
In-Reply-To: <549EEFCC.9030202@je-eigen-domein.nl>
References: <1419554775-11560-1-git-send-email-bos@je-eigen-domein.nl>
 <1419554775-11560-2-git-send-email-bos@je-eigen-domein.nl>
 <20141226180839.53e2df6f@free-electrons.com>
 <b66fd2b4894b872b928f81fdf13998ec@to-the-max.net>
 <20141227145132.1c48523a@free-electrons.com>
 <549EEFCC.9030202@je-eigen-domein.nl>
Message-ID: <20141227190755.10b11f1c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

On Sat, 27 Dec 2014 18:43:40 +0100, Floris Bos wrote:

> Do note that the only thing using PNG inside libvncserver is the 
> TightPNG encoding.
> Think it is a bit counter-inductive to give users TightPNG support, just 
> because another package selected libpng, even though they chose not to 
> select the TightPNG feature.
> 
> (Just like I believe it is counter-inductive that users are expected to 
> know which dependencies are needed to get a specific feature they want, 
> as seems to be the current case with many buildroot packages, which do 
> not offer any feature options).

This topic has been the source of many discussions in the Buildroot
community, and we're trying to find a balance between two options:

 * Have sub-options in each package for all the various possible
   optional features they have. This makes it more explicit for users,
   but on the flip side generates a huge maintenance burden, as we
   would have a much much larger number of Config.in options to
   maintain.

 * Make optional features automatically enabled. This is less explicit
   for users, but it is sometimes good (like if you have OpenSSL
   enabled, enable SSL support everywhere it is possible), and avoids
   creating zillions of Config.in options.

So generally, on a case by case basis, we decide which of the solution
is the most appropriate. Sometimes the latter is good enough and avoids
creating more Config.in options, sometimes the former is really
necessary to make it explicit to the user what is happening. I don't
think it is possible to settle on one or the other solution and apply
this decision unconditionally to all packages.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
