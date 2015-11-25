From: Hajime Branko Yamasaki Vukelic <branko@brankovukelic.com>
Date: Wed, 25 Nov 2015 10:48:29 +0100
Subject: [Buildroot] Overriding Buildroot packages
In-Reply-To: <5654E4F2.2020405@mind.be>
References: <CAPER3A0P1Qyd_=ktyHt=udawndUfHue8SE_zDQxMHjz+r+pPtg@mail.gmail.com>
 <20151124164107.3570084a@free-electrons.com>
 <CAPER3A0tE2_edxtE65MaVUVUh3BOdqywb4jUANOe_4Jm+0fihw@mail.gmail.com>
 <5654E4F2.2020405@mind.be>
Message-ID: <CAPER3A3yd6N6VWhM4uYJTq7pjBdiQ2=zQ-Mzu_aH+LBSNoaDSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 24, 2015 at 11:30 PM, Arnout Vandecappelle <arnout@mind.be> wrote:

[SNIP]

>> Ideally, ability to override some aspect of an existing package (e.g.,
>> only its version, or only the source URL, or something along those
>> lines) would be great to have. If not, then, a mechanism to make two
>> packages equivalent (something like virtual packages but applicaable
>> to packages that are not explicitly virtual) would also work (e.g.,
>> `POSTGRES_95_PROVIDES = postgres`, that causes having postgres-95
>> selected to satisfy dependency requirement for a package that
>> selects/depends on postgres).
>
>  There is a fairly easy way to make it possible to override the version and
> dependencies, but I think it's a bit ugly. In inner-generic-package, instead of
> defining all the rules directly, we could add yet another level of direction and
> delay the definition of the rules until after BR2_EXTERNAL has been included.

What if a package has <pkgname>.hash file? If I simply override the
version, wouldn't that still break when checking the hash?


-- 
Branko
branko at brankovukelic.com

/dev/blog: brankovukelic.com
