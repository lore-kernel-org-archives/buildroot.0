From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Nov 2014 09:26:34 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-11-27
In-Reply-To: <20141128073010.C02491017B8@stock.ovh.net> (Thomas Petazzoni's
 message of "Fri, 28 Nov 2014 08:30:10 +0100 (CET)")
References: <20141128073010.C02491017B8@stock.ovh.net>
Message-ID: <87d287n32d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Build statistics for 2014-11-27
 > ===============================

 >         success : 203
 >        failures : 13 
 >        timeouts : 2  
 >           TOTAL : 218

Only ~6%, that's nice!

>          sh4 |             btrfs-progs-3.17.1 | NOK | http://autobuild.buildroot.net/results/9f182cd5955d724750135bcd6cb7e315fb28334f/

That should now be fixed by Baruch's patch.


 >       x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/9bc82aa8c687f8f8744d7cc53204c5ea7af1e015/
 >       x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/ae6c4be9d7e0644224a9076c91b0e2d7119dc820/

Hmm, don't know - Host/target confusion?


>          arc | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/b60591fc6ba3fff3c3fccc91368430a81b0e0271/

Seems to miss linking with -lm


> microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/62570f69e9f75b74040887c064edfb72e438a96b/

Python issue. Perhaps python2/python3 issue as BR2_PACKAGE_PYTHON3 is
enabled?

 >        nios2 |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/79cbae4dab3ad712bc20c752fdd91e168eade9fe/

Problems finding avformat? It does use a minimalistic ffmpeg
configuration, but we do unconditionally pass --enable-avformat, so I
don't know.


>       x86_64 |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/6bd8c009056beb67092abd6d18064500302dcecb/

Static linking issue?


 >        nios2 |                  mpg123-1.21.0 | NOK | http://autobuild.buildroot.net/results/437f408122d7f21420a7cdc9758caf0ab1ba877d/

configure issue. It seems like mpg123 should also depend on host-pkgconf.


 >          arm |                    perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/c0854e49720ce1934daebaf7d85d55383dd0a959/

uClibc static linking issue.

>          arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/e74efded899744d757cb798c44f096b54898f95a/

It uses gdlib-config from the path, so it breaks when the host has it
installed. Francois, could you write patch (and send upstream) to
allow us to tell it to use the one we have in $STAGING_DIR/usr/bin instead?


>          arm |                      vlc-2.1.5 | NOK | http://autobuild.buildroot.net/results/ee3fbed47a69446f1907690cf0a8dccbf9717f84/

host/target library path confusion.


>         bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/91ddd6b131bb26f5c2d3cdf0a33fbe470b4e632c/

C++ gibberish?

-- 
Bye, Peter Korsgaard
