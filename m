From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 11 Mar 2009 21:52:24 +0100
Subject: [Buildroot] automated build of cross toolchains
In-Reply-To: <49B783C6.8070107@yahoo.fr> (Hichem Boussetta's message of "Wed\,
	11 Mar 2009 10\:26\:30 +0100")
References: <49B783C6.8070107@yahoo.fr>
Message-ID: <878wnb93zr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hichem" == Hichem Boussetta <boussettahichem@yahoo.fr> writes:

 Hichem> Hi,
 Hichem> I am a newbie to buildroot, and I would like to know if it is possible
 Hichem> to make the configuration process of buildroot automated.
 Hichem> I mean that, for example, if I wanted to build, in a batch mode,
 Hichem> several cross toolchains for some specific architecturse that I would
 Hichem> have defined beforehand, how should I proceed.
 Hichem> In fact, I thought about making a script that runs many times the
 Hichem> "make config" command and that supplies the adequate configuration,
 Hichem> but I don't think this is the best solution.
 Hichem> Is there any other solution like generating a default config by
 Hichem> running "make config" and somehow modifying the .config file each time
 Hichem> it is necessary in the script ?

Just copy your .config's somewhere else and copy them in place
whenever you want to build that configuration. This is pretty much
what the make <project>_defconfig make target does.

Also have a look at the make O=</path/to/build/in> support.

E.G. something like:

for project in projectA projectB projectC;
do
        cp configs/$project .config
        yes ''|make oldconfig
        make O=/tmp/build/$project
done

(the yes '' part is to accept the defaults for new configuration
options)

-- 
Bye, Peter Korsgaard
