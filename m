From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Aug 2012 19:31:05 +0200
Subject: [Buildroot] dropbear permission denied
In-Reply-To: <CAAfyv37CS+Hss_-kfiv9tGZDTPpeiG-bzjyF5mqNdL61=PNupg@mail.gmail.com>
References: <8E7CEF5A14A94EDF90F261B9ED2FC9E6@meiernt.local>
 <3C32AECB8207924A9A228348325DB2D29050F1@mntserv.meier-nt.local>
 <20120824135323.654eb15b@skate>
 <CAAfyv37CS+Hss_-kfiv9tGZDTPpeiG-bzjyF5mqNdL61=PNupg@mail.gmail.com>
Message-ID: <20120824193105.13f01c2e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 24 Aug 2012 16:31:38 +0200,
Belisko Marek <marek.belisko@gmail.com> a ?crit :

> > Correct. dropbear doesn't allow login into accounts that have an
> > empty password.
> Is there any way in e.g. post-processing to set some passwd (maybe
> empty) for root user to avoid such troubles? Anybody using it that
> way?

See http://www.elinux.org/images/2/2a/Using-buildroot-real-project.pdf
slide 25. You can use the post-build script mechanism to tune
the /etc/passwd file to set a root password.

I once thought of adding a Kconfig option for that, but it would mean
that the root password would be stored as clear text in the .config
file, which probably isn't that nice.

Should we make the default 'root' password be 'root' so that it is
non-empty and it works with Dropbear? Or simply add a FAQ entry
which explains this problem? Other ideas?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
