From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Oct 2015 22:26:55 +0200
Subject: [Buildroot] Compiler errors pointing in BUILD_DIR when using
 OVERRIDE_SRCDIR
In-Reply-To: <CAKMA=Nbi2xkzg77St8PAbmQ79WKCeFw3KWDTuFkRYNR0pULzeQ@mail.gmail.com>
References: <CAKMA=Nbi2xkzg77St8PAbmQ79WKCeFw3KWDTuFkRYNR0pULzeQ@mail.gmail.com>
Message-ID: <5627F50F.2060201@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21-10-15 15:16, Julien Rosener wrote:
> Hi,
> 
> In my company we are using buildroot for package development.
> According to the buildroot documentation we are using the
> <pkg>_OVERRIDE_SRCDIR mechanism.
> 
> It works great when the build is going well. However when there is a
> compiler error/warning the issue is referring files in
> output/build/<pkg> (because the source code was rsynced at this
> location to be built).
>>From a developer point of view (which is editing source code in
> <pkg>_OVERRIDE_SRCDIR), it is difficult to work because if you jump on
> the error, it does not jump on the source file which is edited. This
> behavior generates mistake.
> 
> What do you think about that (limitation, bug ?) ? Do you think it
> would be possible to improve it ?

 Some people (e.g., me :-) use the same source directory to build several
configurations in separate output directories. In that case, building in the
source directory wouldn't work...

 If the package in question supports out-of-tree building (like e.g. the kernel
or most autotools-based packages), it would be possible that we don't copy the
sources but instead just build out-of-tree in the build directory. Thomas
Petazzoni posted a patch series to that effect about two and a half years ago,
but that series was incomplete and never got applied. So you could take it over,
perhaps improve and repost it. See [1], but mind [2]. Also, Thomas may have a
more recent version of the series.

 Regards,
 Arnout

[1] http://lists.busybox.net/pipermail/buildroot/2013-April/070573.html
[2] http://lists.busybox.net/pipermail/buildroot/2013-May/072556.html


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
