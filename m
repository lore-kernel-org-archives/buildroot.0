From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 30 Nov 2015 23:20:51 +0100
Subject: [Buildroot] [PATCH v2] docs/website: cosmetic changes
In-Reply-To: <CA+TH9V=qDnTm+qyGOCbQE6=EFskevW31jZewqQhk_JS9G35k7w@mail.gmail.com>
References: <1448920481-21268-1-git-send-email-angelo.compagnucci@gmail.com>
 <87oaebjgf3.fsf@dell.be.48ers.dk>
 <CA+TH9V=qDnTm+qyGOCbQE6=EFskevW31jZewqQhk_JS9G35k7w@mail.gmail.com>
Message-ID: <565CCBC3.9010903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30-11-15 23:06, Angelo Compagnucci wrote:
> Hi Peter,
> 
> 2015-11-30 23:01 GMT+01:00 Peter Korsgaard <peter@korsgaard.com>:
>>>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:
>>
>>  > * Resized too big icons in download and documentation
>>  >   pages
>>
>>  > Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>>  > ---
>>  > Cheangelog:
>>
>>  > v1 -> v2:
>>  > Rebase to the latest git version
>>
>>  >  docs/website/css/main.css  |  15 ++-
>>  >  docs/website/docs.html     |  30 ++---
>>  >  docs/website/download.html | 330 ++++++++++++++++++++++-----------------------
>>  >  3 files changed, 189 insertions(+), 186 deletions(-)
>>
>>  > diff --git a/docs/website/css/main.css b/docs/website/css/main.css
>>  > index db9c4c9..57009cf 100644
>>  > --- a/docs/website/css/main.css
>>  > +++ b/docs/website/css/main.css
>>  > @@ -207,16 +207,21 @@ i {
>>  >  .flip-container {
>>  >      perspective: 1000;
>>  >  }
>>  > -    /* flip the pane when hovered */
>>  > -    .flip-container:hover .flipper, .flip-container.hover .flipper {
>>  > -            transform: rotateY(180deg);
>>  > -    }
>>  > +/* flip the pane when hovered */
>>  > +.flip-container:hover .flipper, .flip-container.hover .flipper {
>>  > +    transform: rotateY(180deg);
>>  > +}
>>
>>  > -.flip-container, .front, .back {
>>  > +.flip-container, .flip-container .front, .flip-container .back {
>>  >      width: 180px;
>>  >      height: 180px;
>>  >  }
>>
>>  > +.flip-container-small, .flip-container-small .front, .flip-container-small .back {
>>  > +    width: 120px;
>>  > +    height: 120px;
>>  > +}
>>  > +
>>  >  /* flip speed goes here */
>>  >  .flipper {
>>  >      transition: 0.6s;
>>  > diff --git a/docs/website/docs.html b/docs/website/docs.html
>>  > index 9cee36d..23cc13f 100644
>>  > --- a/docs/website/docs.html
>>  > +++ b/docs/website/docs.html
>>  > @@ -13,59 +13,59 @@
>>
>>  >        <div class="row mt centered">
>>  >      <div class="col-sm-4">
>>  > -      <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
>>  > +      <div class="flip-container flip-container-small center-block" ontouchstart="this.classList.toggle('hover');">
>>  >          <div class="flipper">
>>  >            <div class="front">
>>  > -            <a href="/manual.html"><img src="images/browser.png" width="180" alt=""></a>
>>  > +            <a href="/manual.html"><img src="images/browser.png" width="120" alt=""></a>
>>
>> I'm far from a web expert, but why are we telling the browser to
>> downscale these images?
>>
>> file docs/website/images/browser.png
>> docs/website/images/browser.png: PNG image data, 256 x 256, 8-bit/color RGBA, non-interlaced
>>
>> E.G. why don't we send a 180x180 (or 120x120) image in the first place?
> 
> They were from a smashing magazine free theme at that resolution, so i
> left the original image size. They can be rescaled, I'll glad to do it
> if you think it's important (to me not so much!)

 There are various reasons why it's better to scale at the server side:

- smaller image => less bandwidth;
- often better scaling algorithm with a real tool than with the browser;
- less visual discrepancy between different browsers.

> 
>>
>> Same for the other images.
>>
>>> +++ b/docs/website/download.html
>>  > @@ -4,176 +4,174 @@
>>  >  <div class="row nh">
>>  >  <div class="col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
>>
>>  > -  <div class="panel panel-primary">
>>
>> This diff is not very readable to me. Notice that I'm right now changing
>> download.html (to release 2015.11), so it would be good if you could
>> rebase (again!).
> 
> No problem, I'll wait for a few more minutes (I'm tired!) and if the
> git tree will be updated, I'll send a patch in no time!

 And then please also avoid the whitespace change :-)

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
