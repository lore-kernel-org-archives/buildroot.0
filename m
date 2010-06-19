From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 19 Jun 2010 19:45:53 +0200
Subject: [Buildroot] [PATCH 08/10] linux: adjust kernel config according
	to the Buildroot configuration
In-Reply-To: <20100619162435.1039628c@surf> (Thomas Petazzoni's message of
	"Sat, 19 Jun 2010 16:24:35 +0200")
References: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
	<cover.1276454802.git.thomas.petazzoni@free-electrons.com>
	<655e8a3a75bc2f73712ebabca64e83805dd8b87d.1276454802.git.thomas.petazzoni@free-electrons.com>
	<87y6ec9lf5.fsf@macbook.be.48ers.dk> <20100619162435.1039628c@surf>
Message-ID: <87ljaaapbi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> I'm not sure I like this hardcoded policy. What if the user wants to run
 >> some precompiled OABI binaries together with his EABI rootfs?

 Thomas> I don't really like this hardcoded policy either, but I kept what
 Thomas> existed before.

 Thomas> What should we do ? Just not modify the kernel configuration, except
 Thomas> for the initramfs case ? Isn't the EABI thing going to hit a large
 Thomas> number of users, coming back with a "my Busybox init doesn't start"
 Thomas> question ?

I find the EABI one ok, but the COMPAT thing is afaik just an
optimization, it doesn't really harm to have it enabled.

 Thomas> +	yes "" | $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) oldconfig 2>&1 >/dev/null
 >> 
 >> The yes shouldn't be needed, and I don't like hiding errors.

 Thomas> It does not hide errors, it uses the default choice for every unset
 Thomas> option :-)

It's the 2>&1 >/dev/null that I don't like - That does hide errors.

-- 
Bye, Peter Korsgaard
