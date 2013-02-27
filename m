From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 27 Feb 2013 20:15:53 +0100
Subject: [Buildroot] [PATCH] qt: install QML imports on target
In-Reply-To: <878v6c859c.fsf@dell.be.48ers.dk>
References: <1361355531-2909-1-git-send-email-daniel.nystrom@timeterminal.se>
 <CAHQn0kg71pmwYCTo9EbGZOFF-PO2s99pZ4GrSC2gDbuy31QUqA@mail.gmail.com>
 <878v6c859c.fsf@dell.be.48ers.dk>
Message-ID: <512E5B69.7070201@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/02/13 22:15, Peter Korsgaard wrote:
>>>>>> "Daniel" == Daniel Nystr?m<daniel.nystrom@timeterminal.se>  writes:
>   Daniel> On Wed, Feb 20, 2013 at 11:18 AM, Daniel Nystr?m <
>   Daniel>daniel.nystrom at timeterminal.se> wrote:
>
>   Daniel>     When selecting the Qt declarative module, all the QML imports was
>   Daniel>     built and installed to staging, but never installed to the target.
>
>   Daniel>     Signed-off-by: Daniel Nystr?m<daniel.nystrom@timeterminal.se>
>
>
>   Daniel> Bumping this patch as I think this is a good candidate for the
>   Daniel> 2013.02 release.  Currently QtDeclarative is supported by
>   Daniel> Buildroot, but the QML imports are not installed to target. The
>   Daniel> current imports are:
>
>   Daniel> ./QtWebKit/libqmlwebkitplugin.so
>   Daniel> ./Qt/labs/folderlistmodel/libqmlfolderlistmodelplugin.so
>   Daniel> ./Qt/labs/gestures/libqmlgesturesplugin.so
>   Daniel> ./Qt/labs/particles/libqmlparticlesplugin.so
>
> It would be good if someone who knows anything about Qt can ack this
> patch for 2013.02.

  Basic QML works without this patch. (Actually, I can't be 100% sure 
because the display on my board is currently broken, but at least the 
application doesn't report an error when I start it.) So I don't think 
this is really needed for 2013.02.

  This patch is only necessary if you want to use one of those plugins in 
your QML application. I therefore don't agree with always installing 
them. There should be a configure option to enable it. Although, maybe 
making this 200K installation configurable for a package that already 
consumes 15M is perhaps a bit silly... Therefore:

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
  (for next)

Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
  (build-test)

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
