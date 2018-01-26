From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Jan 2018 13:43:23 +0100
Subject: [Buildroot] [PATCH] scanpypi: ignore empty elements in package
 requirements
In-Reply-To: <1516695187-1193-1-git-send-email-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Tue, 23 Jan 2018 09:13:07
 +0100")
References: <1516695187-1193-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <87o9lgiydw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > Depending on how setup.py reads requirements files empty elements can occur.
 > This patch takes care, that such elements will be ignored and don't crash
 > the scanpypi script.

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 > ---
 >  utils/scanpypi | 4 +++-
 >  1 file changed, 3 insertions(+), 1 deletion(-)

 > diff --git a/utils/scanpypi b/utils/scanpypi
 > index d043135..7392c50 100755
 > --- a/utils/scanpypi
 > +++ b/utils/scanpypi
 > @@ -299,7 +299,9 @@ class BuildrootPackage():
 >                          for req in self.pkg_req]
 
 >          # get rid of commented lines and also strip the package strings
 > -        self.pkg_req = [item.strip() for item in self.pkg_req if item[0] != '#']
 > +        print("Req: {}".format(self.pkg_req))

What is this print for? Just debugging? Did you mean to add it?

-- 
Bye, Peter Korsgaard
