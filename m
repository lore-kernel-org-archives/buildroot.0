From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 30 Nov 2015 00:09:15 +0100
Subject: [Buildroot] Overriding Buildroot packages
In-Reply-To: <CAPER3A3yd6N6VWhM4uYJTq7pjBdiQ2=zQ-Mzu_aH+LBSNoaDSw@mail.gmail.com>
References: <CAPER3A0P1Qyd_=ktyHt=udawndUfHue8SE_zDQxMHjz+r+pPtg@mail.gmail.com>
 <20151124164107.3570084a@free-electrons.com>
 <CAPER3A0tE2_edxtE65MaVUVUh3BOdqywb4jUANOe_4Jm+0fihw@mail.gmail.com>
 <5654E4F2.2020405@mind.be>
 <CAPER3A3yd6N6VWhM4uYJTq7pjBdiQ2=zQ-Mzu_aH+LBSNoaDSw@mail.gmail.com>
Message-ID: <565B859B.10400@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25-11-15 10:48, Hajime Branko Yamasaki Vukelic wrote:
> On Tue, Nov 24, 2015 at 11:30 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> 
> [SNIP]
> 
>>> Ideally, ability to override some aspect of an existing package (e.g.,
>>> only its version, or only the source URL, or something along those
>>> lines) would be great to have. If not, then, a mechanism to make two
>>> packages equivalent (something like virtual packages but applicaable
>>> to packages that are not explicitly virtual) would also work (e.g.,
>>> `POSTGRES_95_PROVIDES = postgres`, that causes having postgres-95
>>> selected to satisfy dependency requirement for a package that
>>> selects/depends on postgres).
>>
>>  There is a fairly easy way to make it possible to override the version and
>> dependencies, but I think it's a bit ugly. In inner-generic-package, instead of
>> defining all the rules directly, we could add yet another level of direction and
>> delay the definition of the rules until after BR2_EXTERNAL has been included.
> 
> What if a package has <pkgname>.hash file? If I simply override the
> version, wouldn't that still break when checking the hash?

 That's right, we'd need to find a workaround of that as well.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
