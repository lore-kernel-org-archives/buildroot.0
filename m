From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Apr 2017 13:53:53 +0200
Subject: [Buildroot] [PATCHv2] libbson: new package
In-Reply-To: <1491587714.491322104@f30.my.com>
References: <libbson:> <1491567498-24437-1-git-send-email-semenak94@mail.ru>
 <1783c11b-00c2-8fe3-7c2b-ec6f23149771@mind.be>
 <1491587714.491322104@f30.my.com>
Message-ID: <1df728ce-3c14-a9d8-2f11-cbe837a90e38@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Semyon,

 Please keep the list in Cc. Your questions and answers may be relevant to other
people as well, and you may get faster answers from someone else.


On 07-04-17 19:55, semenak94 at mail.ru wrote:
> Thanks for such detailed answer and  your patience! I'm still a newcomer in
> buildroot community and it's my first experience in open source.

 We aim to please :-) (though sometimes we miss :-P )


> And I have some question : how correctly set all licenses of package, except
> watching license file? I'm not experienced in it... 

 It's unfortunately not so easy. Many packages reuse source code from somewhere
else, so you really have to look at every file to check the license. Fortunately
there are tools that can help:

- the 'licensecheck' script in Debian/Ubuntu;
- fossology, which has an online version at https://fossology.ist.unomaha.edu/

 However, some files in the source code are not used at all (e.g.
windows-specific sources), or don't end up in the target (e.g. the build
scripts), and these shouldn't be included in the license statement.

 For packages that have a Debian equivalent, it's also a good idea to look at
the copyright declaration in Debian, but sometimes their binary packages are
split up differently which can make it tricky to get it right.

> Does license in buildroot
> have any more value,  than formal signature?

 Not sure what you mean here. The license specification helps people to
understand which licenses they have to comply with when they use the result of
the Buildroot build. If with "formal signature" you mean the Signed-off-by, that
only says something about compliance with the license of Buildroot itself, it
has nothing to do with packages.

 Regards,
 Arnout

> 
> Thanks a lot and sorry for stupid questions.
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
