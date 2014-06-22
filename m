From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 22 Jun 2014 20:52:32 +0200
Subject: [Buildroot] [PATCH 1 of 5 RFC] uclibc: menuconfig: take into
 account initial settings from config file
In-Reply-To: <CANxTyt5VxZd9gKc7Ft-3UDxyWSSsb+iP3vrAVd1m=6vr54KPgA@mail.gmail.com>
References: <patchbomb.1403444739@localhost>
 <97d74ccbe054d9a16465.1403444740@localhost>
 <20140622185233.0d553f8d@free-electrons.com>
 <f2f7913c-0555-46d8-9e41-9a8099a8c683@email.android.com>
 <CANxTyt5VxZd9gKc7Ft-3UDxyWSSsb+iP3vrAVd1m=6vr54KPgA@mail.gmail.com>
Message-ID: <CAAXf6LVLsBq1Mh2eN+48SV0aYq_tBM-ZnRFSL=UTLReAxySNSg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Danomi,

On Sun, Jun 22, 2014 at 7:29 PM, Danomi Manchego
<danomimanchego123@gmail.com> wrote:
> How about moving the XXX_COPY_CONFIG to the top of the
> .stamp_config_file_fixed actions, and then make xxxx-menuconfig update
> on that too?
>
> That might be nicer than, say, changing the added COPY in the
> xxxx-menuconfig to a "[ -f $(XXXX_BUILD_CONFIG) ] ||
> $(XXXX_COPY_CONFIG)"

I'm not sure I fully get what you mean, can you elaborate?

Note that there is another problem in this patch: when running 'make
clean xxx-update-config', the config does not yet exist. This case
should be handled too.

Best regards,
Thomas
