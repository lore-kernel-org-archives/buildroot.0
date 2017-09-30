From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 30 Sep 2017 19:16:17 +0200
Subject: [Buildroot] [PATCH v2] pkg-download: remove explicit
 PKG_VERSION from github helper
In-Reply-To: <87o9psfgq6.fsf@dell.be.48ers.dk>
References: <1504765866-7138-1-git-send-email-marcin.nowakowski@imgtec.com>
 <4596376b-607d-46f5-1c57-d8e8791cf57b@mind.be>
 <87o9psfgq6.fsf@dell.be.48ers.dk>
Message-ID: <01885726-bcc2-5930-5076-6882bf199c8a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30-09-17 15:39, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
>  > On 07-09-17 08:31, Marcin Nowakowski wrote:
>  >> Currently it is always required to add package version as an argument to
>  >> the github helper. Since the version is always defined as PKG_VERSION,
>  >> drop this argument and generate it automatically inside the helper
>  >> routine.
>  >> 
>  >> The github helper function is extended to support both 2 and 3 argument
>  >> variants (ie. either use the provided package version argument or
>  >> automatically substitute with PKG_VERSION if not available), which can
>  >> make the transition of the package files easier as well allows using the
>  >> 3-argument variant outside of package definitions.
>  >> 
>  >> Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
> 
> 
>  >  Applied to master, thanks. I extended the text in the manual a little bit to
>  > cover the case where you do have to use the third argument.
> 
>  >  Next step is a mass update removing the third argument.
> 
> Have you tested this? It doesn't seem to work for me UNLESS I use
> 
> FOO_SITE := $(call github,user,product)
> 
> Instead of the normal FOO_SITE = to get it expanded right away. I guess
> pkgname gets expanded too late.

 Gah, my fault. I had written to use $(PKG) instead of $(pkgname) in v1 of the
patch, but didn't double-check in v2. Hm, reading back my comment, I wasn't very
explicit about it apparently.

 Regards,
 Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
