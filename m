From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Aug 2017 14:07:31 +0200
Subject: [Buildroot] [PATCH] package/qt5base: libgtk3 support depends on
 X11 backend
In-Reply-To: <20170810231732.7ba8034f@gmx.net>
References: <1502237350-17331-1-git-send-email-joshua.henderson@microchip.com>
 <trinity-db7b134a-e9a6-4a07-a674-162538e759b3-1502264291114@3capp-gmx-bs63>
 <7eec17a3-366b-6303-c836-d3744b89333d@mind.be>
 <20170810231732.7ba8034f@gmx.net>
Message-ID: <023c3cba-e8d7-78c0-d2ad-bfce5baeb6a9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-08-17 23:17, Peter Seiderer wrote:
> Hello Arnout,
> 
> On Wed, 9 Aug 2017 23:53:52 +0200, Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>>  Hi Peter,
>>
>> On 09-08-17 09:38, Peter Seiderer wrote:
>>> Hello Joshua,
>>>
>>>> Gesendet: Mittwoch, 09. August 2017 um 02:09 Uhr
>>>> Von: "Joshua Henderson" <joshua.henderson@microchip.com>
>>>> An: buildroot at buildroot.org
>>>> Cc: "Peter Seiderer" <ps.report@gmx.net>, "Julien Corjon" <corjon.j@ecagroup.com>, "Brent Sink" <brents_3@hotmail.com>, "Naoki Matsumoto" <n-matsumoto@melcoinc.co.jp>
>>>> Betreff: [PATCH] package/qt5base: libgtk3 support depends on X11 backend
>>>>
>>>> libgtk3 can conditionally be build with or without the X11 backend unlike
>>>> libgtk2. If libgtk3 is enabled and the X11 backend is not enabled for
>>>> BR2_PACKAGE_QT5_VERSION_LATEST, a build error [1] is introduced.  This change
>>>> disables gtk support in this case.
>>> NAK - or only as a workaround, the real issue is a missing QT_EGL_NO_X11/MESA_EGL_NO_X11_HEADERS
>>> define, see e.g. [2] for further discussion...
>>
>>  Do you expect a proper resolution to arrive before 2017.08, or should I apply
>> Joshua's patch (with modified commit message) to master after all?
> 
> Would prefer to try patch [3] or add MESA_EGL_NO_X11_HEADERS define via
> arch.conf (as done e.g. for libatomic by Yann's patch [4])...but will
> not find enough time the next two weeks to try...

 Also your reference [3] got negative review, and doing it through arch.conf
sounds like a hack. So I've applied to master, with a few changes:
    - extend commit message
    - improve comment
    - also pass -no-gtk if libgtk3 is not selected

 Regards,
 Arnout

> 
> Regards,
> Peter
> 
> [3] https://codereview.qt-project.org/#/c/198906/
> [4] https://git.buildroot.net/buildroot/commit/?id=7d286be4f96cfb731e184c3e8cfea27a031bde3c
> 
>>
>>  Regards,
>>  Arnout
>>
>>>
>>> Regards,
>>> Peter
>>>
>>> [2] http://lists.busybox.net/pipermail/buildroot/2017-July/196075.html
>>>
>>
> 
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
