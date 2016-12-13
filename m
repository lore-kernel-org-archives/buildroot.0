From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Dec 2016 17:34:02 +0100
Subject: [Buildroot] [PATCH v3 0/7] qt5 bump to 5.8.0-rc
In-Reply-To: <20161213172254.750ab43b@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 13 Dec 2016 17:22:54 +0100")
References: <1481641171-10407-1-git-send-email-anaumann@ultratronik.de>
 <20161213164933.6ffc2b51@free-electrons.com>
 <8737hr4xg6.fsf@dell.be.48ers.dk>
 <20161213172254.750ab43b@free-electrons.com>
Message-ID: <87y3zj3i11.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Tue, 13 Dec 2016 17:15:37 +0100, Peter Korsgaard wrote:

 >> Related to that - With the move to GPLv3, should we keep v5.6 around
 >> next to v5.8 for a while (as a version selection or separate packages)?
 >> 
 >> Maintaining both is not really nice, but GPLv3 is an issue for some
 >> people/companies.

 > I agree that this license change can be an issue for some
 > people/companies. However, for them, staying on Qt 5.6 is no a viable
 > solution long term either, right.

No, indeed not - But it is something that there has been quite some
"noise" about in the news.


 > Also, do we do this for Samba ? For gcc ? For the myriad of other
 > projects that moved to GPLv3 ?

We kept the old samba package around for quite some time after adding
samba4, and we still have qt 4.x.

IANAL, but the GPLv3 issue is less a problem for the toolchain than for
libraries.


 > Isn't it going to be a pain to maintain both versions in parallel? A
 > Config.in choice doesn't get randomized on our autobuilders, so the
 > older version would never be tested.

Yes, it is a pain. And introducing a separate BR2_PACKAGE_QT58 (or
whatever) package also isn't nice.


 > So I'm not particularly thrilled with supporting both versions :/

Me neither, but it is something we need to decide about, which is why
I'm bringing the question.

What do others say? How is E.G. yocto handling it?

-- 
Bye, Peter Korsgaard
