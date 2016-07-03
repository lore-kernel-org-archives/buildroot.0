From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 3 Jul 2016 21:30:27 +0200
Subject: [Buildroot] [PATCH 1/1 v3] pyqtgraph: new package
In-Reply-To: <CAGduivwFkd6aiysSepGysOJOiaweTKS=qbd0d5UtcccWE7sr=A@mail.gmail.com>
References: <1444755264-17899-1-git-send-email-guillaume.bressaix@gmail.com>
 <CAGduivwFkd6aiysSepGysOJOiaweTKS=qbd0d5UtcccWE7sr=A@mail.gmail.com>
Message-ID: <bfb8666e-8d79-d5b3-ca4b-14f8f875dcf4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03-07-16 11:30, Maxime Hadjinlian wrote:
> Hi Guillaume, all
> 
> Thank you for your patches, I have made a few comments inline, your
> patch has been marked as Changes Requested in our patchwork, if you
> can address theses and resend a new version of your patch.
> 
> On Tue, Oct 13, 2015 at 6:54 PM, Guillaume William Bres
> <guillaume.bressaix@gmail.com> wrote:
[snip]
>> +       select BR2_PACKAGE_PYTHON_PYQT
>> +       select BR2_PACKAGE_PYTHON_NUMPY # runtime dependency
>> +       select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime dependency
>> +       select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 #runtime dependency
>> +       select BR2_PACKAGE_QT_SVG # runtime dependency
> It doesn't make sense to select BR2_PACKAGE_QT_SVG without selecting
> BR2_PACKAGE_QT. And it's fine to select it, because it's not a hidden
> dependency, it's even in the name of the package.

 BR2_PACKAGE_PYTHON_PYQT selects BR2_PACKAGE_QT already, and pyqtgraph doesn't
use Qt directly, so the way it's done now is OK IMO.


 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
