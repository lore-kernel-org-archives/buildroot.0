From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 4 Apr 2016 22:26:12 +0200
Subject: [Buildroot] [PATCH 1/2] qt5connectivity: add sdpscanner tool
 for Qt5Bluetooth
In-Reply-To: <CAGm1_ktt4d7ELbUUuEyPX6qiEvXbBdOGhkiC4+yu_s3K6VP4kw@mail.gmail.com>
References: <1459763762-31640-1-git-send-email-corjon.j@ecagroup.com>
 <CAGm1_ktt4d7ELbUUuEyPX6qiEvXbBdOGhkiC4+yu_s3K6VP4kw@mail.gmail.com>
Message-ID: <5702CDE4.1080703@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/04/16 12:02, Yegor Yefremov wrote:
> Hi Julien, all,
>
> On Mon, Apr 4, 2016 at 11:56 AM, Julien Corjon <corjon.j@ecagroup.com> wrote:
>> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
>> ---
>>   package/qt5/qt5connectivity/qt5connectivity.mk | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
>> index a68f5ec..936bc6f 100644
>> --- a/package/qt5/qt5connectivity/qt5connectivity.mk
>> +++ b/package/qt5/qt5connectivity/qt5connectivity.mk
>> @@ -43,6 +43,7 @@ endif
>>
>>   define QT5CONNECTIVITY_INSTALL_TARGET_CMDS
>>          cp -dpf $(STAGING_DIR)/usr/lib/libQt5Bluetooth.so.* $(TARGET_DIR)/usr/lib
>> +       cp -dpf $(STAGING_DIR)/usr/bin/sdpscanner $(TARGET_DIR)/usr/bin
>
> would $(INSTALL) be preferable here? Do we have any rules?

  We generally prefer install, but in this case it's nice to keep the same 
construct as the previous line, so I'm OK with it. So:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


  That said, I wonder why we are doing all this manual copying for qt5, instead 
of just running 'make install'. AFAICS the only thing that isn't already cleaned 
up in the finalize step are the QML files, and these can easily be cleaned up as 
a finalize hook. Thomas, do you remember why you did it this way?

  Regards,
  Arnout

>
> Yegor
>
>>          $(QT5CONNECTIVITY_INSTALL_TARGET_QMLS)
>>   endef
>>
>> --
>> 2.5.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
