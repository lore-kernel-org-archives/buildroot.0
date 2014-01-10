From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jan 2014 15:42:18 +0800
Subject: [Buildroot] [RFC] python: select vs depends on
In-Reply-To: <CAAXf6LWjtJzLPxrfET-Wd8661_21QfddOXv1B27uL48BK-o2Kg@mail.gmail.com>
References: <CAAXf6LWHabEdHC4V4rzVduUqxx3a9vPjiJ91yYjs9+5UQtaFQQ@mail.gmail.com>
 <20131224172836.GB3627@free.fr>
 <CAAXf6LUi0n6Mf0b9njsffZYcPMqCKD5ZoK41REhu_oRrJLiovA@mail.gmail.com>
 <52CE4C47.9020808@mind.be>
 <OF6AA003C2.855761A0-ON86257C5B.004E8CAE-86257C5B.004ED616@rockwellcollins.com>
 <CAAXf6LWjtJzLPxrfET-Wd8661_21QfddOXv1B27uL48BK-o2Kg@mail.gmail.com>
Message-ID: <20140110154218.6d94ca2c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 10 Jan 2014 07:44:50 +0100, Thomas De Schampheleire wrote:

> > For what it's worth, I added in menuconfig options to all of the SELinux
> > packages to specifically enable the Python bindings.  When that option is
> > enabled, Python is selected.  Doing it this was way chosen after several
> > conversations with Thomas P. about the issue.
> 
> Ah, interesting!
> So Thomas, what do you have to say for yourself? ;-)

In the SELinux libraries, the Python stuff is only used when you want
to *debug* SELinux (i.e tune your SELinux policy). Therefore, it is
unlikely that you will need all these SELinux Python bindings on a
final production system. Therefore, it didn't seem appropriate to
enable them automatically when Python is enabled: you may well want to
have Python *and* SELinux on a system, but necessarily have all the
Python bindings of these SELinux libraries, since those are only needed
for debugging purposes.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
