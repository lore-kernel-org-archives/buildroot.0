From: Mike Williams <mike@mikebwilliams.com>
Date: Mon, 23 Mar 2015 11:08:38 -0400
Subject: [Buildroot] [PATCH v2 09/25] rsyslog: fix systemd service
	installation
In-Reply-To: <20150320203852.5f23a9ff@free-electrons.com>
References: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
 <1426878856-15747-10-git-send-email-mike@mikebwilliams.com>
 <20150320203852.5f23a9ff@free-electrons.com>
Message-ID: <CANPyyuMnP=ooXV-EcBhPNm1z2HdH7iZZMa+bEupD7-fQRCJR-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Fri, Mar 20, 2015 at 3:38 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Mike Williams,
>
> On Fri, 20 Mar 2015 15:14:00 -0400, Mike Williams wrote:
>
>>  define RSYSLOG_INSTALL_INIT_SYSTEMD
>> -     ln -sf /lib/systemd/system/rsyslog.service \
>> +     ln -fs ../../../usr/lib/systemd/system/rsyslog.service \
>>               $(TARGET_DIR)/etc/systemd/system/syslog.service
>
> Are you sure?
>
> Isn't the syslog.service -> rsyslog.service symbolic link meant to have
> kind of a "compatibility" service name? If so, shouldn't this symlink
> be in /usr/lib/systemd/system/ instead ?

I enabled it on the target with 'systemctl enable' and duplicated the
steps in the .mk file

# systemctl enable rsyslog.service
Created symlink from /etc/systemd/system/syslog.service to
/usr/lib/systemd/system/rsyslog.service.
Created symlink from
/etc/systemd/system/multi-user.target.wants/rsyslog.service to
/usr/lib/systemd/system/rsyslog.service.

However, we should add a mkdir -p /etc/systemd/system before. Would
you like me to send a new patch?

Mike
