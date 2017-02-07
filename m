From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Feb 2017 15:28:57 +0100
Subject: [Buildroot] [V2 1/1] ntp: security bump to verserion 4.2.8p9
In-Reply-To: <CAFSsvmqWkJqiUOnCtJh0eJmtqqVJdCZ1wh8uBVSy4bAZbcPFuw@mail.gmail.com>
 (Adam Duskett's message of "Mon, 6 Feb 2017 16:18:15 -0500")
References: <20170206141225.2311-1-aduskett@codeblue.com>
 <20170206155817.5e945678@free-electrons.com>
 <1486393216.2005.19.camel@codeblue.com>
 <20170206160232.7513524b@free-electrons.com>
 <91082fe8-697b-f4c9-a154-e74ab462a138@mind.be>
 <CAFSsvmqWkJqiUOnCtJh0eJmtqqVJdCZ1wh8uBVSy4bAZbcPFuw@mail.gmail.com>
Message-ID: <878tpirs5y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:

 > After doing some digging into the source code, it looks like there
 > are two new files: include/libssl_compat.h and libssl_compat.c

 > These files are now referenced in quite a few places, all of which
 > would take quite a bit of time to unwind.

 > I would suggest leaving openssl as a dependency unless somebody else
 > wants to take a crack at cleaning it up.

Yes, I had a look as well. Most can be handled by a #ifdef OPENSSL
around the openssl specific stuff, but a number of places now use more
EVP_MD_CTX_* functions that aren't covered by the emulation functions in
ntp_md5.h.

-- 
Bye, Peter Korsgaard
