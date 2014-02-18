From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Feb 2014 17:18:46 +0100
Subject: [Buildroot] [PATCH v7 3/4] infra: Introduce BR2_HOST_NEEDS_JAVA
In-Reply-To: <1392680233-24585-4-git-send-email-maxime.hadjinlian@gmail.com>
References: <1392680233-24585-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1392680233-24585-4-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20140218171846.6969c9a6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Tue, 18 Feb 2014 00:37:12 +0100, Maxime Hadjinlian wrote:
> XBMC needs Java on the host in order to build, because it  uses a
> code-generator which is build in two phases:
> In the first phase SWIG is used to parse C++ header files that define the API.
> SWIG outputs an XML file that contains a complete description of the structure
> of the API.
> In the second phase, the XML file is ingested by a Groovy (Java) program that
> then creates C++ code that forms the bridge to the scripting language (Python).
> 
> The second phase is why we need java on the host.

People inventing such horrible code generation flows really have a
problem. They should probably talk to M-x doctor.

> +# Hidden boolean selected by packages in need of Java in order to build
> +# (example: xbmc)
> +config BR2_HOST_NEEDS_JAVA
> +	bool

Do we need a kconfig bool for this? We have the same situation for
classpath, and we haven't introduced a specific kconfig bool for it.

Moreover, I am not sure BR2_HOST_NEEDS_JAVA is the right name. It's not
really the host that needs Java, it's the compilation process that
requires a host Java. So BR2_NEEDS_HOST_JAVA is probably more
technically correct.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
