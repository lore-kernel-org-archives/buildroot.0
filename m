From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
Date: Mon, 10 Oct 2011 15:35:59 +0200
Subject: [Buildroot] configure error with dependency
In-Reply-To: <CAAXf6LXkdGessMWWqfFjiReajBg4=nhn0bpg=-NRws9EVR8fmQ@mail.gmail.com>
References: <4E8F0EC8.6020403@sensortherm.de>
 <CAAXf6LXkdGessMWWqfFjiReajBg4=nhn0bpg=-NRws9EVR8fmQ@mail.gmail.com>
Message-ID: <4E92F4BF.7030700@sensortherm.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

now, it works ;-)

I had some problems with the PKG_CONFIG_PATH variable.

Regards,

Klaus


Am 10.10.2011 12:21, schrieb Thomas De Schampheleire:
> Hi,
>
> On Fri, Oct 7, 2011 at 4:38 PM, Klaus Schwarzkopf
> <schwarzkopf@sensortherm.de>  wrote:
>> Hi,
>>
>> how can i solve the following error in the attached patch?
>>
>> configure: error: icon-naming-utils>= 0.8.90 is required to build
>>                  and install tango-icon-theme
>
> Please supply some more information (e.g. did icon-naming-utils
> actually get built, and so is the problem is that tango-icon-theme
> doesn't find it, or isn't it built in the first place).
>
> In the first case, I have encountered such issues with other packages
> I tried to add.
> Can you try to explicitly pass the appropriate
> --with-XX=$(STAGING_DIR)/usr option to the configure step of
> tango-icon-theme?
>
> So something like:
> TANGO_ICON_THEME_CONF_OPT = --with-icon-naming-utils=$(STAGING_DIR)/usr
>
> I'm not sure whether this is the official way, but in my case this worked.
>
> Best regards,
> Thomas
