From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Jun 2017 23:06:06 +0200
Subject: [Buildroot] [RFC PATCH v3 00/10] Make the SDK relocatable
In-Reply-To: <dec2b16c-50f5-15d2-2082-c31ca82170ec@mind.be>
References: <1490255693-9134-1-git-send-email-wg@grandegger.com>
 <6799ad7b-a16e-d89e-eb73-d7d91880d341@mind.be>
 <d993626e-11b0-ab21-f022-d64f6a7340b6@grandegger.com>
 <8b074253-3002-1db9-d902-a73bb47e734b@grandegger.com>
 <dec2b16c-50f5-15d2-2082-c31ca82170ec@mind.be>
Message-ID: <d447e85c-6c32-d73f-377c-cf109c425511@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-06-17 23:03, Arnout Vandecappelle wrote:
>  Preferably as an instrumentation hook, because:
> - it speeds things up dramatically if you do 'make foo-rebuild';
> - things are still correct if you interrupt the build in the middle;
> - it makes no difference if you do a rebuild (if patchelf is done at the end,
> and then you rebuild a package, the RPATH in the libs you link with is different
> than the first time you built it).

 Note, however, that doing it as an instrumentation hook could be a pretty
dramatic rewrite of your series, so if you don't feel up to it, I'm ok with
committing the current approach to begin with.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
