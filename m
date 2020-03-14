From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 17:27:31 +0100
Subject: [Buildroot] [PATCH v2] package/qt5webengine: fix translations
 target install path
In-Reply-To: <20200221073331.9942-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Fri, 21 Feb 2020 08:33:31 +0100")
References: <20200221073331.9942-1-ps.report@gmx.net>
Message-ID: <87imj6x5os.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Through the evolution of the qt5webengine package patch ([1], [2])
 > until the initial commit ([3]) the translations target install
 > path got mangled resulting in a double trailing qtwebengine_locales
 > path:
 >   /usr/translations/qtwebengine_locales/qtwebengine_locales
 > Instead of:
 >   /usr/translations/qtwebengine_locales

 > Fixes the translations runtime access failure resulting in the
 > following warning:

 >   WARNING:resource_bundle_qt.cpp(116): locale_file_path.empty() for locale

 > [1] http://lists.busybox.net/pipermail/buildroot/2015-July/132010.html
 > [2] https://patchwork.ozlabs.org/patch/640633
 > [3] https://git.buildroot.net/buildroot/commit/?id=89080bac9bc47946a09c1e74f2f872363bf6785b

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > ---
 > Changes v1 -> v2:
 >   - re-add mkdir to fix translation installation path

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
