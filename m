From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jan 2015 17:37:07 +0100
Subject: [Buildroot] [PATCH v4 05/17] erlang-goldrush: new package.
In-Reply-To: <CAJtjsKYkHzbXw7RTzeC9L8sH40aFR3hnEwP6C1cDSHZ3HmjnHA@mail.gmail.com>
References: <1418135662-773-1-git-send-email-johan.oudinet@gmail.com>
 <1418135662-773-6-git-send-email-johan.oudinet@gmail.com>
 <20150104223602.09aaf9da@free-electrons.com>
 <CAJtjsKYkHzbXw7RTzeC9L8sH40aFR3hnEwP6C1cDSHZ3HmjnHA@mail.gmail.com>
Message-ID: <20150105173707.15bb9e1c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Oudinet,

On Mon, 5 Jan 2015 15:52:27 +0100, Johan Oudinet wrote:

> > No <pkg>_LICENSE ?
> 
> It is an ISC license, and the abbreviation is not available within Buildroot.

This doesn't make sense: the <pkg>_LICENSE field is a free-form text
field. You can put whatever you want in this field. Whenever possible,
we prefer to use the SDPX license identifiers
(http://spdx.org/licenses/).

Also:

$ git grep "LICENSE.*ISC"
package/at/at.mk:AT_LICENSE = GPLv2+, GPLv3+, ISC
package/bind/bind.mk:BIND_LICENSE = ISC
package/crda/crda.mk:CRDA_LICENSE = ISC
package/dhcp/dhcp.mk:DHCP_LICENSE = ISC
package/harfbuzz/harfbuzz.mk:HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
package/libass/libass.mk:LIBASS_LICENSE = ISC
package/libconfuse/libconfuse.mk:LIBCONFUSE_LICENSE = ISC
package/libuv/libuv.mk:LIBUV_LICENSE = BSD-2c, BSD-3c, ISC, MIT
package/odhcploc/odhcploc.mk:ODHCPLOC_LICENSE = ISC
package/pure-ftpd/pure-ftpd.mk:PURE_FTPD_LICENSE = ISC
package/python-certifi/python-certifi.mk:PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
package/sudo/sudo.mk:SUDO_LICENSE = ISC BSD-3c
package/tmux/tmux.mk:TMUX_LICENSE = ISC
package/wireless-regdb/wireless-regdb.mk:WIRELESS_REGDB_LICENSE = ISC
package/yajl/yajl.mk:YAJL_LICENSE = ISC

> Excellent idea. I've just modified pkg-rebar to do that and I'll
> remove erlang and host-erlang-rebar from the dependencies of all
> erlang packages.

Great.

> > Might be good to say a word in the commit log to explain why a host
> > variant of this library is needed.
> 
> Ok. So I should not provide an host variant unless some other packages need it?

Indeed. Why would we want to have dead/unused code?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
