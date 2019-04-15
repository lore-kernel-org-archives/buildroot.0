From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Apr 2019 23:14:16 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/ngircd: fix static build with openssl and atomic
In-Reply-To: <25c2ed7a-d9b3-8066-6cfc-e26c84713dec@mind.be>
References: <20190414155153.4317-1-fontaine.fabrice@gmail.com>
 <20190415221011.55b0ea91@windsurf>
 <25c2ed7a-d9b3-8066-6cfc-e26c84713dec@mind.be>
Message-ID: <20190415231416.050afc4d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Apr 2019 23:08:00 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > package/ngircd/ngircd.mk:23: use $() to delimit variables, not ${}
> > package/ngircd/ngircd.mk:26: use $() to delimit variables, not ${}  
> 
>  Huh? How could this ever have worked? make will replace the ${SERIAL_TESTS}
> with the empty string, since the SERIAL_TESTS variable is not defined. Fabrice,
> did you actually test this? Or maybe the SERIAL_TESTS is empty anyway?

SERIAL_TESTS would be "serial-tests" in our case:

  https://github.com/ngircd/ngircd/blob/master/autogen.sh#L190

https://www.gnu.org/software/automake/manual/html_node/Serial-Test-Harness.html

I guess it's only used when you run "make check", so we don't really
care in the context of Buildroot.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
