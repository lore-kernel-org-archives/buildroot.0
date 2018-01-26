From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 26 Jan 2018 13:48:36 +0100
Subject: [Buildroot] [PATCH] scanpypi: ignore empty elements in package
 requirements
In-Reply-To: <87o9lgiydw.fsf@dell.be.48ers.dk>
References: <1516695187-1193-1-git-send-email-yegorslists@googlemail.com>
 <87o9lgiydw.fsf@dell.be.48ers.dk>
Message-ID: <CAGm1_ksde3hV57Ww0V5o5G7693QEpoHVSy2CLXcsmscXGfb8Zg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 26, 2018 at 1:43 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:
>
>  > From: Yegor Yefremov <yegorslists@googlemail.com>
>  > Depending on how setup.py reads requirements files empty elements can occur.
>  > This patch takes care, that such elements will be ignored and don't crash
>  > the scanpypi script.
>
>  > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>  > ---
>  >  utils/scanpypi | 4 +++-
>  >  1 file changed, 3 insertions(+), 1 deletion(-)
>
>  > diff --git a/utils/scanpypi b/utils/scanpypi
>  > index d043135..7392c50 100755
>  > --- a/utils/scanpypi
>  > +++ b/utils/scanpypi
>  > @@ -299,7 +299,9 @@ class BuildrootPackage():
>  >                          for req in self.pkg_req]
>
>  >          # get rid of commented lines and also strip the package strings
>  > -        self.pkg_req = [item.strip() for item in self.pkg_req if item[0] != '#']
>  > +        print("Req: {}".format(self.pkg_req))
>
> What is this print for? Just debugging? Did you mean to add it?

You're right. It was for debugging. I'll send v2.

Yegor
