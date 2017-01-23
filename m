From: =?UTF-8?Q?C=C3=A9dric_Marie?= <cedric.marie@openmailbox.org>
Date: Mon, 23 Jan 2017 14:39:45 +0100
Subject: [Buildroot]
 =?utf-8?q?=5BPATCH_1/2=5D_Add_BR2=5FCMAKE=5FUSE=5FNIN?=
 =?utf-8?q?JA=5FBACKEND_option?=
In-Reply-To: <ef982565-16ec-591b-aaed-d22e5a634851@gmail.com>
References: <20170106223748.2203-1-cedric.marie@openmailbox.org>
 <ef982565-16ec-591b-aaed-d22e5a634851@gmail.com>
Message-ID: <2260e784237284271ff7745986b82cc8@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 2017-01-21 23:25, Romain Naour a ?crit?:
> There are currently 146 packages using CMake in Buildroot, I'm not sure 
> all of
> them support ninja backend yet.

I don't think there is anything specific to a package that can make it 
support ninja backend or not.
CMake provides several backends, and the result is expected to be the 
same whatever the backend. If not, this is a bug in CMake.

> I would suggest to enable Ninja backend package by package when it has
> been tested.

What do you mean exactly "enable Ninja backend package by package"?
- Add an option for each package?
- Switch to ninja backend if supported by the package, without option 
(i.e. force ninja backend)?
- Keep a global option - the one in my patch - but only apply it on 
packages that will define a specific package variable to say "OK I can 
do it"?

My point of view is that we should keep a global option - that could be 
described as experimental - and never enable it in an official 
defconfig.
If someone enables it, and find a package that does not compile with 
ninja backend, he can either disable the option (he knows that it is 
experimental), or/and send a bug to either CMake or the package 
maintainer.

Moreover, I think we can't just say "this package is ninja compliant". 
Maybe if we change a single option in configure step, it will not 
compile anymore.

Let me know what you're expecting exactly...

> Indent with one tab.
> Indent with one tab and 2 spaces.

OK, sorry for that, didn't pay enough attention.


> I think these changes should be in a preparatory patch before adding 
> Ninja
> backend support.

Sorry I don't understand what you mean with "preparatory patch".

Regards,

-- 
C?dric
