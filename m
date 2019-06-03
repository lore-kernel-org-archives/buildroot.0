From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 3 Jun 2019 13:32:44 -0700
Subject: [Buildroot] error with `make uclibc-menuconfig`
In-Reply-To: <CAM3m09S7iwrJ5KQAXwzG41LKYkvzKJ2bOwpgCEno3_v1hkwbVA@mail.gmail.com>
References: <CAM3m09S7iwrJ5KQAXwzG41LKYkvzKJ2bOwpgCEno3_v1hkwbVA@mail.gmail.com>
Message-ID: <CAMo8BfK6zjW3W3-whHUY8PYB7rfJXtSTJez9d9S8mmXtJWEwpg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ryan,

On Mon, Jun 3, 2019 at 1:16 PM Ryan Whelan <rcwhelan@gmail.com> wrote:
> When running `make uclibc-menuconfig`, (2019-02-2) with my configuration file for buildroot (attached), I get the following error.
>
> Kconfig fragment 'uclibc-config' for 'uclibc' does not exist

You have BR2_UCLIBC_CONFIG variable set to uclibc-config, but apparently
you don't have such file or it is not located where buildroot expects it (in the
root of the buildroot source tree).

By default BR2_UCLIBC_CONFIG is set to package/uclibc/uClibc-ng.config

-- 
Thanks.
-- Max
