From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Sep 2016 22:54:08 +0200
Subject: [Buildroot] [PATCH v2] python-pyqt5: new package
In-Reply-To: <20160920211456.7dc36850@free-electrons.com>
References: <20160819134225.1490-3-develop@manuel-voegele.de>
 <20160823092606.1462-1-develop@manuel-voegele.de>
 <20160920211456.7dc36850@free-electrons.com>
Message-ID: <ffa5e5ad-a682-fb7e-98c7-3e14a7bdef43@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-09-16 21:14, Thomas Petazzoni wrote:
>> +comment "python-pyqt5 needs a toolchain w/ wchar, NPTL, C++, dynamic library"
>> > +        depends on !BR2_PACKAGE_QT
> This line is unrelated (mentions Qt, while this package is for Qt5),
> and in fact not needed: this package is *selecting* Qt5, so there is
> no need to take into account a Qt dependency here.

 Well, since the main symbol depends on !BR2_PACKAGE_QT, you would expect either
a comment that explains that, or you would expect the other comments to be
hidden. So to me it makes sense to have that depends for the comment. Otherwise,
you go and enable wchar, NPTL, C++, dynlib, you come back, and hey presto the
comment disappears but the package still can't be selected.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
