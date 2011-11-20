From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Nov 2011 09:36:18 +0100
Subject: [Buildroot] Report from the Buildroot Developer Day
In-Reply-To: <201111181751.22578.arnout@mind.be>
References: <20111102160349.4afe5935@skate>
 <CAAXf6LUYoR7Hoasa0K-Rc3qJuATFn8mKWMbuKNtnU6XSSALpaQ@mail.gmail.com>
 <CAEYzJUHexHVW+q95qUD3dVp5cTJp7Hu2yGShdkNr5w-rRfnoBw@mail.gmail.com>
 <201111181751.22578.arnout@mind.be>
Message-ID: <20111120093618.6f3b85ea@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 18 Nov 2011 17:51:22 +0000,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>  I consider clean-staging less important than clean-target.  Having
> things lingering around in staging is usually not a problem, except
> for the presence of some header or .pc of a library that is no longer
> present.  Normally buildroot should disable old that in the configure
> step, but of course you can never be sure.

Well, I don't think we can assume that this is true. When a package
version is bumped, nobody checks carefully that no new config options
had been added for optional dependencies on libraries. So I'm pretty
sure that there are many, many packages in Buildroot that don't do
--disable-<foo> when the library is not available.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
