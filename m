From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 5 Mar 2015 08:23:31 +0100
Subject: [Buildroot] [PATCH v2] cmake: don't use any header available in
	$(HOST_DIR)/usr/include
In-Reply-To: <20150305070255.GY15668@tarshish>
References: <1425516333-3234-1-git-send-email-fabio.porcedda@gmail.com>
 <20150305070255.GY15668@tarshish>
Message-ID: <CAHkwnC-BJceW=wE9FB4EqNiyOWk_vSidS9O0UbA4JO4gbp2zNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 5, 2015 at 8:02 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Fabio,
>
> On Thu, Mar 05, 2015 at 01:45:33AM +0100, Fabio Porcedda wrote:
>> +# Get rid of -I* options to prevent that a header avaiable in
>> +# $(HOST_DIR)/usr/include is used instead of a cmake one, e.g. lzma*
>> +# headers of the xz package
>> +HOST_CMAKE_CFLAGS = $(shell echo $(HOST_CFLAGS) | sed s/-I[^\ ]*//)
>
> How about (untested):
>
>         HOST_CMAKE_CFLAGS = $(filter-out -I%,$(HOST_CFLAGS))

Right, i forgot about te filter-out function, i will use that.

Thanks
-- 
Fabio Porcedda
