From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 2 Aug 2014 14:55:52 -0400
Subject: [Buildroot] permissions of downloaded source
Message-ID: <CANxTyt7OFibLhjuXH1fVZmxuPE5ky1yMsWG98DDyq=6tw=Scgw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

Apologies if this was already addressed - I didn't follow all of the
download helper re-org threads ...

Using mktemp in the download help scripts means that downloaded
archives have 600 permissions.  On purpose?  This seems not so good
when groups use a shared "dl" directory.  Maybe these lines in the
download helper scripts:

mv "${tmp_output}" "${output}"

should be:

install -m0644 "${tmp_output}" "${output}"

?

Danomi -
