From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Oct 2008 14:43:26 +0100
Subject: [Buildroot] Problem with program_transform_name and naming of
 installed binaries
In-Reply-To: <20081031113307.14125656@surf>
References: <20081031113307.14125656@surf>
Message-ID: <20081031144326.24ce23c1@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 31 Oct 2008 11:33:07 +0100,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> Of course, this is not the desired behaviour, since binaries on the
> target also end up with the arm-blablabla prefix. However, after a
> quick look at ./configure, I don't really understand what's the logic
> to compute this program_transform_name variable.
> 
> Any clue ?

FYI, the related autoconf documentation is available at
http://www.gnu.org/software/autoconf/manual/html_node/Transforming-Names.html#Transforming-Names.

It seems that by default, the binary names are transformed to be
prefixed with the target name, which is what I see. Should we add
--program-prefix= and --program-transform-name= to the CONFIGURE_OPTS ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
